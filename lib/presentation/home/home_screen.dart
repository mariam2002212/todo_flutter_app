import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/presentation/home/add_task_bottom_sheet/add_task.dart';
import 'package:todo/presentation/home/tabs/settings/settings_tab.dart';
import 'package:todo/presentation/home/tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  GlobalKey<TasksTabState> tasksTabKey = GlobalKey();

  // The current theme mode
  ThemeMode _themeMode = ThemeMode.light;

  List<Widget> tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      TasksTab(key: tasksTabKey),
      SettingsTab(switchTheme: (newTheme) {
                  setState(() {
                   _themeMode = newTheme;});})
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFAB(),
      bottomNavigationBar:buildBottomNavBar(),
      body: tabs[currentIndex],
      );
  }
  Widget buildFAB()=>FloatingActionButton(
    //shape: StadiumBorder(side:BorderSide(color: ColorsManager.white,width: 4.h) ),
    onPressed:()async{
      await AddTaskBottomSheet.show(context);
      //ro7 hat el taskat awel m elbottomsheet y2fl
      tasksTabKey.currentState?.getTodosFromFireStore();

    } ,
    child: Icon(Icons.add),
  );
  Widget buildBottomNavBar()=>BottomAppBar(
notchMargin: 8.sp,
    child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (selected){
          currentIndex = selected;
          setState(() {});
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'Settings')
        ]),
  );
}
