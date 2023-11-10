import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/screens/home/home_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key})
      : super(key: key ?? const ValueKey("AdminHomePage"));

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
      key: const ValueKey("AdminHomePage"),
      currentIndex: currentPageIndex,
      viewList: HomeViews.adminViewList,
      viewTitles: HomeViews.adminViewTitles,
    );
  }
}
