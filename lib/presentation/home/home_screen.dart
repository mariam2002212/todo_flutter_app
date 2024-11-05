import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/presentation/home/tabs/settings/settings_tab.dart';
import 'package:todo/presentation/home/tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs=[TasksTab(),SettingsTab()];
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
    onPressed:(){} ,
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
