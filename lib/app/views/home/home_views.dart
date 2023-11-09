import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/screens/home/feed_page.dart';
import 'package:hitch_handler_v2/app/views/screens/home/profile_page.dart';

class HomeViews {
  static List<Widget> studentViewTitles = [
    getHomeTitle("Home"),
    //"Search",
    getHomeTitle("Add"),
    //"Archive",
    getHomeTitle("Account"),
  ];
  static List<Widget> studentViewList = const [
    FeedPage(),
    //ProfilePage(),
    SizedBox(),
    //FeedPage(),
    ProfilePage(),
  ];

  static List<Widget> adminViewTitles = [
    getHomeTitle("Home"),
    //"Search",
    //"Archive",
    getHomeTitle("Account"),
  ];

  static List<Widget> adminViewList = const [
    FeedPage(),
    //ProfilePage(),
    //FeedPage(),
    ProfilePage(),
  ];
}

Widget getHomeTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.8,
    ),
  );
}
