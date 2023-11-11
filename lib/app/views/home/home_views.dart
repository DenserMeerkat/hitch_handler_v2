import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_title.dart';
import 'package:hitch_handler_v2/app/views/screens/common/search_page.dart';
import 'package:hitch_handler_v2/app/views/screens/home/feed_page.dart';
import 'package:hitch_handler_v2/app/views/screens/home/profile_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class HomeViews {
  static List<Widget> studentViewTitles = [
    const FeedTitle(),
    getHomeTitle("Search"),
    getHomeTitle("Add"),
    getHomeTitle("Archive"),
    getHomeTitle("Account"),
  ];
  static List<Widget> studentViewList = const [
    FeedPage(),
    SearchPage(),
    TempView(emptyText: "Add"),
    TempView(emptyText: "Archive"),
    ProfilePage(),
  ];

  static List<Widget> adminViewTitles = [
    getHomeTitle("Home"),
    getHomeTitle("Search"),
    //"Archive",
    getHomeTitle("Account"),
  ];

  static List<Widget> adminViewList = const [
    FeedPage(),
    SearchPage(),
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
