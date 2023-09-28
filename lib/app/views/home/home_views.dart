import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/more_vert.dart';

class HomeViews {
  static List<Widget> homeViewList = const [
    CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          actions: [MoreVert()],
        ),
      ],
    ),
    CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text("Search"),
        ),
      ],
    ),
    SizedBox(),
    CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text("Bookmarks"),
        ),
      ],
    ),
    CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text("Profile"),
        ),
      ],
    ),
  ];
}
