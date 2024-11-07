import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/extensions/date_extension.dart';
import 'package:todo/core/utils/text_styles.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static void show(context){
    showModalBottomSheet(
        isScrollControlled:true,
        context: context,
        builder: (context)=> Padding(padding: MediaQuery.of(context).viewInsets,child: AddTaskBottomSheet(),),
    );
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add New Task',style: LightTxtStyles.bottomSheetTitle,textAlign: TextAlign.center,),
          TextFormField(decoration: InputDecoration(
            hintText: 'enter your task',
              hintStyle: LightTxtStyles.bottomSheetHintText
          )),
          SizedBox(height: 8.h,),
          TextFormField(decoration: InputDecoration(
            hintText: 'enter your task description',hintStyle: LightTxtStyles.bottomSheetHintText
          )),
          SizedBox(height: 8.h,),
          Text('Select Date',style: LightTxtStyles.selectDate,),
          InkWell(
            onTap: (){
              showTaskDate(context);
            },
            child: Text(
              selectedDate.toFormattedDate,
              textAlign: TextAlign.center,
              style: LightTxtStyles.bottomSheetHintText,),
          ),
          Spacer(),
          ElevatedButton(onPressed: (){},
              child: Text('Add Task'))
        ],
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
}
