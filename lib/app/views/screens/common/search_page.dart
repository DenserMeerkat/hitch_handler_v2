import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_flex.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        leading: CustomIconButton(
          tooltip: "Close",
          icon: Icon(
            Icons.close,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
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
          SliverToBoxAdapter(
            child: Container(
              height: 690.h,
            ),
          )
        ],
      ),
    );
  }
}
