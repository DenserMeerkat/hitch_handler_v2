import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_flex.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: getHomeTitle("Search"),
        leading: CustomIconButton(
          iconData: Icons.close,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: false,
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 60,
            flexibleSpace: const FeedFlex(),
            bottom: bottomLine(context, height: 16),
          ),
          const SliverFillRemaining(
            child: TempView(
              emptyText: "Search",
            ),
          )
        ],
      ),
    );
  }
}
