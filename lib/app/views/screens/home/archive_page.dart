import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/archive/archive_tab_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late int current;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    current = tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          primary: false,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 54,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(54),
            child: ArchiveTabBar(
              tabController: tabController,
            ),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              TempView(emptyText: "No Posts"),
              TempView(emptyText: "No Bookmarks"),
              TempView(emptyText: "No Upvotes"),
            ],
          ),
        )
      ],
    );
  }
}
