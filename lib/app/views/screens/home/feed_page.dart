import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/feed/chip_scroll_view.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_flex.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 90,
          flexibleSpace: FeedFlex(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: ChipsScrollView(),
          ),
        ),
        SliverFillRemaining(
          child: TempView(emptyText: "No Posts"),
        )
      ],
    );
  }
}
