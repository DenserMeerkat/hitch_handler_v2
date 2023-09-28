import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/feed/chip_scroll_view.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/tertiary_icon_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 90,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  const Spacer(),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 94,
                    height: 36,
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
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  TertiaryIconButton(
                    tooltip: "Filter",
                    icon: Icons.tune_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: ChipsScrollView(),
          ),
        ),
        const SliverFillRemaining(
          child: TempView(emptyText: "No Posts"),
        )
      ],
    );
  }
}
