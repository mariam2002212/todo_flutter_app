import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/extensions/date_extension.dart';
import 'package:todo/core/utils/text_styles.dart';
import 'package:todo/presentation/home/tabs/tasks/task_widget/task_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedCalDate = DateTime.now();

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
        //buildCalender(),
        TaskWidget()
      ],
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
            setState(() {});
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
}