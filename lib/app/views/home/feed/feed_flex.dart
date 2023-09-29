import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/feed/filter_sheet.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/tertiary_icon_button.dart';

class FeedFlex extends StatelessWidget {
  const FeedFlex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return FlexibleSpaceBar(
      background: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              width: 90,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isDarkMode
                    ? Theme.of(context)
                        .inputDecorationTheme
                        .fillColor!
                        .withOpacity(0.6)
                    : Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.4),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 0.4,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(
                    Icons.search,
                    size: 18,
                    color: Theme.of(context)
                        .inputDecorationTheme
                        .helperStyle!
                        .color,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Search",
                    style: TextStyle(
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .helperStyle!
                          .color,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            TertiaryIconButton(
              tooltip: "Filter",
              icon: Icons.tune_outlined,
              onTap: () {
                showFilterSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
