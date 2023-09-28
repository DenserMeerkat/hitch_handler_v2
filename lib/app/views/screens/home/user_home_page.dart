import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/home_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/settings_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  final viewList = HomeViews.homeViewList;
  final viewTitles = HomeViews.homeViewTitles;

  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Text(
          viewTitles[currentPageIndex],
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
          ),
        ),
        actions: [const SettingsButton(), SizedBox(width: 6.w)],
      ),
      bottomNavigationBar: HomeBottomBar(
        currentPageIndex: currentPageIndex,
        onDestinationChange: onDestinationChange,
      ),
      child: viewList[currentPageIndex],
    );
  }
}
