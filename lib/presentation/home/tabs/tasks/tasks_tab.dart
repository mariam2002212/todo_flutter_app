import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/extensions/date_extension.dart';
import 'package:todo/core/utils/text_styles.dart';
import 'package:todo/database_manager/model/todo_data_model.dart';
import 'package:todo/database_manager/model/user_data_model.dart';
import 'package:todo/presentation/home/tabs/tasks/task_widget/task_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime selectedCalDate = DateTime.now();
  List<TodoDM> todosList = [];

  /// empty state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodosFromFireStore(); //
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: ColorsManager.blue,
              height: 100.h,
            ),
            buildCalender(),
          ],
        ),
        Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                //print(todosList.length);
                return TaskWidget(
                  todo: todosList[index],
                  onDeletedTask: () {
                    getTodosFromFireStore();
                  },
                  onEditedTask: (todo) {
                    getTodosFromFireStore();
                  },
                );
              },
              itemCount: todosList.length,
            )
        )
      ]
    );
  }

  Widget buildCalender() {
    return EasyInfiniteDateTimeLine(
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        focusDate: selectedCalDate,
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateChange: (selectedDate) {},
      itemBuilder: (context, date, isSelected, onTap) {
        return InkWell(
          onTap: (){
            selectedCalDate = date;
            getTodosFromFireStore();
          },
          child: Card(
            color: ColorsManager.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date.getDayName,style: isSelected?LightTxtStyles.selectedCalenderText:LightTxtStyles.unselectedCalenderText,),
                SizedBox(height: 5.h,),
                Text('${date.day}',style: isSelected?LightTxtStyles.selectedCalenderText:LightTxtStyles.unselectedCalenderText)
              ],
            ),
          ),
        );
      },
    );
  }
  void getTodosFromFireStore() async {
    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);

    //filter tasks by the date
    QuerySnapshot collectionSnapShot = await todoCollection
        .where('dateTime',
        isEqualTo: selectedCalDate.copyWith(
          hour: 0,
          microsecond: 0,
          minute: 0,
          millisecond: 0,
          second: 0,
        )).get();

    List<QueryDocumentSnapshot> documentsSnapShot = collectionSnapShot.docs;
    // convert list of querysnapshots to list of my todos
    todosList = documentsSnapShot.map(
          (docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        //ttodo byakhod eljson w trg3li obj mn eltodo
        TodoDM todo = TodoDM.fromFireStore(json);
        return todo;
      },).toList();
    setState(() {});
  }
}