import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/home/feed/sort_popup_menu.dart';
import 'package:hitch_handler_v2/providers/feed_provider.dart';
import 'package:provider/provider.dart';

class FeedFlex extends StatelessWidget {
  const FeedFlex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FeedProvider feedProvider = context.watch<FeedProvider>();
    return FlexibleSpaceBar(
      background: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12),
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () => context.go("/student/search"),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(16)),
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: const Row(
                  children: [
                    Gap(12),
                    Icon(
                      Icons.search,
                      size: 18,
                    ),
                    Gap(8),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )),
            SortPopupMenu(
              feedProvider: feedProvider,
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(16)),
            ),
          ],
        ),
      ),
    );
  }
}
