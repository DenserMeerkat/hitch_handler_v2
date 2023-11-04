import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/screens/home/feed_page.dart';
import 'package:hitch_handler_v2/app/views/screens/home/profile_page.dart';

class HomeViews {
  static List<String> homeViewTitles = const [
    "Home",
    //"Search",
    "Add",
    //"Archive",
    "Account",
  ];
  static List<Widget> homeViewList = const [
    FeedPage(),
    //ProfilePage(),
    SizedBox(),
    //FeedPage(),
    ProfilePage(),
  ];
}
