import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_title.dart';
import 'package:hitch_handler_v2/app/views/screens/home/feed_page.dart';
import 'package:hitch_handler_v2/app/views/screens/home/archive_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class HomeViews {
  static List<Widget> studentViewTitles = [
    const FeedTitle(),
    getHomeTitle("Add"),
    getHomeTitle("Archive"),
  ];
  static List<Widget> studentViewList = const [
    FeedPage(),
    TempView(emptyText: "Add"),
    ProfilePage(),
  ];

  static List<Widget> adminViewTitles = [
    const FeedTitle(),
    getHomeTitle("Archive"),
  ];

  static List<Widget> adminViewList = const [
    FeedPage(),
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
