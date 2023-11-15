import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_title_popup_menu.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

class FeedTitle extends StatelessWidget {
  const FeedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    FeedProvider feedProvider = context.watch<FeedProvider>();
    UserProvider userProvider = context.read<UserProvider>();
    final bool isAdmin = userProvider.userModel?.userType == UserEnum.admin;
    return Row(
      children: [
        FeedTitlePopupMenu(
          feedProvider: feedProvider,
          feedTitle: "Feed",
          popupBackgroundColor: Theme.of(context)
              .appBarTheme
              .backgroundColor!
              .mix(Theme.of(context).colorScheme.primary, 5),
          popupBorderColor: Colors.transparent,
          popupDividerColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderColor: Theme.of(context).appBarTheme.backgroundColor!,
          dividerColor: Theme.of(context).appBarTheme.backgroundColor!,
        ),
        const Spacer(),
        CustomIconButton(
          icon: const Icon(
            Icons.search,
            size: 22,
          ),
          onPressed: () {
            isAdmin
                ? context.go("/admin/search")
                : context.go("/student/search");
          },
          tooltip: "Search",
        ),
      ],
    );
  }
}
