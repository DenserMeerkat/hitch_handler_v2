import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_flex.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          child: TempView(emptyText: "No Posts"),
        )
      ],
    );
  }
}
