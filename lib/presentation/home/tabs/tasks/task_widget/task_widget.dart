import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/extensions/date_extension.dart';
import 'package:todo/core/utils/text_styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/database_manager/model/todo_data_model.dart';
import 'package:todo/database_manager/model/user_data_model.dart';

class TaskWidget extends StatefulWidget {
  final TodoDM todo;
  final Function onDeletedTask;
  final Function(TodoDM) onEditedTask;

  TaskWidget({
    super.key,
    required this.todo,
    required this.onDeletedTask,
    required this.onEditedTask,
  });

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  late bool _isDone;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(text: widget.todo.description);
    _selectedDate = widget.todo.dateTime;
    _isDone = widget.todo.isDone;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.4.r,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              onPressed: (context) {
                deleteTodoFromFireStore(widget.todo);
                widget.onDeletedTask();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                openEditDialog(context); // Open dialog to edit task
              },
              backgroundColor: ColorsManager.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: REdgeInsets.all(10.0),
            child: Row(
              children: [
                // The blue vertical line
                Container(
                  height: 62.h,
                  width: 4.w,
                  margin: REdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: ColorsManager.blue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                // Task title and description
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.todo.title, style: LightTxtStyles.taskWidgetTitle),
                    Text(widget.todo.description, style: LightTxtStyles.taskWidgetDescription),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isDone = !_isDone; // Toggle completion state locally
                    });

                    // Now update the Firestore with the new isDone value
                    updateIsDoneInFireStore(_isDone); // Update Firestore with the new state
                  },
                  child: Icon(
                    _isDone ? Icons.check_circle : Icons.check_circle_outline,
                    color: _isDone ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Open edit dialog to modify task data
  Future openEditDialog(BuildContext context) async {
    DateTime currentDate = _selectedDate;

    final editedTodo = await showDialog<TodoDM>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task"),
        content: SizedBox(
          height: 250.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'This is title',
                  hintStyle: LightTxtStyles.bottomSheetHintText,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Task Details',
                  hintStyle: LightTxtStyles.bottomSheetHintText,
                ),
              ),
              SizedBox(height: 8.h),
              Text('Select Date', style: LightTxtStyles.selectDate),
              InkWell(
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate, // Show the current date by default
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (newDate != null) {
                    _selectedDate = newDate;
                    setState(() {
                    });
                  }
                },
                child: Text(
                  _selectedDate.toFormattedDate,
                  textAlign: TextAlign.center,
                  style: LightTxtStyles.bottomSheetHintText,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  final updatedTodo = TodoDM(
                      id: widget.todo.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dateTime: _selectedDate,
                      isDone: _isDone
                  );
                  Navigator.pop(context, updatedTodo); // Return the updated task to the parent
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ],
      ),
    );

    if (editedTodo != null) {
      // When the user presses "Save Changes", update the task
      widget.onEditedTask(editedTodo); // Notify parent to update task in the list
      updateTodoInFireStore(editedTodo); // Update Firestore
    }
  }

  // Update Todo in Firestore
  Future<void> updateTodoInFireStore(TodoDM todo) async {
    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);
    await todoDoc.update(todo.toFireStore());
  }

  // Delete the todo from Firestore
  void deleteTodoFromFireStore(TodoDM todo) async {
    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);
    await todoDoc.delete();
  }

  // Update the isDone field in Firestore
  Future<void> updateIsDoneInFireStore(bool isDone) async {
    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);

    DocumentReference todoDoc = todoCollection.doc(widget.todo.id); // Get the current task document
    await todoDoc.update({'isDone': isDone}); // Update the isDone field in Firestore
  }

}
