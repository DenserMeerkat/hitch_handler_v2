import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/home_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final views = HomeViews.homeViewList;
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      toolbarHeight: 16.h,
      showTitle: false,
      bottomNavigationBar: HomeBottomBar(
        currentPageIndex: currentPageIndex,
        onDestinationChange: onDestinationChange,
      ),
      child: views[currentPageIndex],
    );
  }

  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}
