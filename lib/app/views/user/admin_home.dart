import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/screens/home/home_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int currentPageIndex = 0;
  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      currentIndex: currentPageIndex,
      viewList: HomeViews.adminViewList,
      viewTitles: HomeViews.adminViewTitles,
    );
  }
}
