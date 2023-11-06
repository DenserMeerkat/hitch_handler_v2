import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/home/feed/sort_popup_menu.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/color_icon_button.dart';
import 'package:hitch_handler_v2/providers/feed_provider.dart';
import 'package:hitch_handler_v2/theme/color_enum.dart';
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
            const Spacer(),
            ColorIconButton(
              tooltip: "Search",
              icon: Icons.search,
              onTap: () {
                context.go("/home/search");
              },
              color: ColorEnum.secondary,
            ),
            const Gap(10),
            SortPopupMenu(
              feedProvider: feedProvider,
            ),
          ],
        ),
      ),
    );
  }
}
