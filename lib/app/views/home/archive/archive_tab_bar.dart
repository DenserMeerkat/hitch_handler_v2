import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTabTap;
  const ProfileTabBar({
    super.key,
    required this.tabController,
    required this.onTabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border(
          bottom:
              BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        controller: tabController,
        dividerColor: Colors.transparent,
        onTap: onTabTap,
        tabs: const [
          Tab(text: "Posts"),
          Tab(text: "Bookmarks"),
          Tab(text: "Upvotes"),
        ],
      ),
    );
  }
}
