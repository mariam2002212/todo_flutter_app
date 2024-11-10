import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/extensions/date_extension.dart';
import 'package:todo/core/utils/text_styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

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
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                openEditDialog(context);
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
                    Text('task title', style: LightTxtStyles.taskWidgetTitle),
                    Text('task description', style: LightTxtStyles.taskWidgetDescription),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.check_circle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openEditDialog(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task"),
        content: SizedBox(
          height: 250.h, // Set a height for the content
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'This is title',
                  hintStyle: LightTxtStyles.bottomSheetHintText,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Task Details',
                  hintStyle: LightTxtStyles.bottomSheetHintText,
                ),
              ),
              SizedBox(height: 8.h),
              Text('Select Date', style: LightTxtStyles.selectDate),
              InkWell(
                onTap: () {
                  showTaskDate(context, selectedDate);
                },
                child: Text(
                  selectedDate.toFormattedDate,
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

                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showTaskDate(BuildContext context, DateTime selectedDate) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      // Update the selectedDate variable here if needed
      // You may need to use a state management solution to reflect this change in the UI
    }
  }
}