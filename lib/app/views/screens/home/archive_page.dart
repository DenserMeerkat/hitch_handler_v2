import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/archive/archive_flex.dart';
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

  void onTabTap(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          primary: false,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: const ProfileFlex(),
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 140,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: ProfileTabBar(
              tabController: tabController,
              onTabTap: onTabTap,
            ),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: tabController,
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
