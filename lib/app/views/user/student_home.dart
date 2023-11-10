import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/screens/home/home_page.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key})
      : super(key: key ?? const ValueKey("StudentHomePage"));

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int currentPageIndex = 0;
  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      key: const ValueKey("StudentHomePage"),
      currentIndex: currentPageIndex,
      viewList: HomeViews.studentViewList,
      viewTitles: HomeViews.studentViewTitles,
    );
  }
}
