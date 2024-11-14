import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/extensions/date_extension.dart';
import 'package:todo/core/utils/text_styles.dart';
import 'package:todo/database_manager/model/todo_data_model.dart';
import 'package:todo/database_manager/model/user_data_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static Future show(context){
   return showModalBottomSheet(
        isScrollControlled:true,
        context: context,
        builder: (context)=> Padding(padding: MediaQuery.of(context).viewInsets,child: AddTaskBottomSheet(),),
    );
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      height: 320.h,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add New Task',style: LightTxtStyles.bottomSheetTitle,textAlign: TextAlign.center,),
            TextFormField(
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Plz, enter task title';
                  }
                  return null;
                },
              controller: titleController,
                decoration: InputDecoration(
              hintText: 'enter your task',
                hintStyle: LightTxtStyles.bottomSheetHintText
            )),
            SizedBox(height: 8.h,),
            TextFormField(
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Plz, enter description';
                  }
                  if (input.length < 6) {
                    return 'Sorry, description should be at least 6 chars';
                  }
                  return null;
                },
                controller: descriptionController,
                decoration: InputDecoration(
              hintText: 'enter your task description',hintStyle: LightTxtStyles.bottomSheetHintText
            )),
            SizedBox(height: 8.h,),
            Text('Select Date',style: LightTxtStyles.selectDate,),
            InkWell(
              onTap: (){
                showTaskDate(context);
                setState(() {
                });
              },
              child: Text(
                selectedDate.toFormattedDate,
                textAlign: TextAlign.center,
                style: LightTxtStyles.bottomSheetHintText,),
            ),
            Spacer(),
            ElevatedButton(onPressed: (){
              addTaskToFireStore();
            },
                child: Text('Add Task'))
          ],
        ),
      ),
    );
  }

  void showTaskDate(context)async{
    selectedDate=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))
    ) ?? selectedDate;
    setState(() {});
  }

  void addTaskToFireStore() {
    // form is valid
    if (formKey.currentState!.validate() == false) return;

    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection(UserDM.collectionName);
    CollectionReference todoCollection = usersCollection
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);
    DocumentReference documentReference = todoCollection.doc();

    TodoDM todo = TodoDM(
        id: documentReference.id,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate.copyWith(
          second: 0,
          millisecond: 0,
          minute: 0,
          microsecond: 0,
          hour: 0,
        ),
        isDone: false);
    documentReference
        .set(todo.toFireStore())
        .then(
          (_) {
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    )
        .onError(
          (error, stackTrace) {},
    )
        .timeout(
      const Duration(seconds: 4),
      onTimeout: () {
        print('enter timeout');
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    );
  }
}
