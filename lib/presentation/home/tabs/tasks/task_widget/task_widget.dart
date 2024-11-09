import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/text_styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/presentation/home/tabs/tasks/edit_widget/edit_widget.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Theme.of(context).colorScheme.onPrimary
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.4.r,
          motion: BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), bottomLeft: Radius.circular(15.r)),
              onPressed: (context){},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context){
                EditWidget();
                print("enterdedit");
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
            borderRadius:BorderRadius.circular(15.r)
          ),
          child: Padding(
            padding: REdgeInsets.all(10.0),
            child: Row(
              children: [
                //the blue vertical line
                Container(
                  height: 62.h,
                    width: 4.w,
                    margin: REdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                        color: ColorsManager.blue,
                        borderRadius:BorderRadius.circular(10.r)
                    )
                ),
                //task title and desc
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('task title',style: LightTxtStyles.taskWidgetTitle,),
                    Text('task description',style: LightTxtStyles.taskWidgetDescription,),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: (){},
                    child: Icon(Icons.check_circle))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
