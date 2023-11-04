import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 1,
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
          //   selectedIcon: Icon(Icons.archive),
          //   icon: Icon(Icons.archive_outlined),
          //   label: "Archives",
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
    return Tooltip(
      message: "Add Post",
      triggerMode: TooltipTriggerMode.longPress,
      verticalOffset: 42,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.go("/home/add");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 65,
              height: 32,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.go("/home/add");
                },
                child: Icon(
                  Icons.add_circle_outline_outlined,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
                ),
              ),
            ),
            const Gap(4),
            Text(
              "Add",
              style: TextStyle(
                fontSize: 12.sp,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
