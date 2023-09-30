import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';

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
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
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
        height: 70,
        surfaceTintColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        onDestinationSelected: onDestinationChange,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 0.1,
          ),
        ),
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.search_outlined),
          //   label: "Search",
          // ),
          AddPostButton(),
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.bookmark),
          //   icon: Icon(Icons.bookmark_outline_outlined),
          //   label: "Bookmarks",
          // ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

class AddPostButton extends StatelessWidget {
  const AddPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 65,
            height: 32,
            child: MaterialClip(
              borderRadius: 30,
              child: InkWell(
                onTap: () {},
                child: Ink(
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
          const SizedBox(height: 4),
          Text(
            "Add",
            style: TextStyle(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
