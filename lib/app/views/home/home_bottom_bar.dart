import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomBar extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onDestinationChange;
  const HomeBottomBar(
      {super.key,
      required this.currentPageIndex,
      required this.onDestinationChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 6.h),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: NavigationBar(
        height: 50.h,
        surfaceTintColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        onDestinationSelected: onDestinationChange,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          const NavigationDestination(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Icon(
                      Icons.add_circle_outline_outlined,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.65),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_outline_outlined),
            label: "Bookmarks",
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
