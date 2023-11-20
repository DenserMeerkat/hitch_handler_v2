import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/elements/bookmark_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/elements/upvote_button.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:tinycolor2/tinycolor2.dart';

class PostActions extends StatelessWidget {
  final FeedPostModel post;
  const PostActions({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context)
        .scaffoldBackgroundColor
        .mix(Theme.of(context).colorScheme.secondary, 10);
    final Color borderColor = Theme.of(context)
        .scaffoldBackgroundColor
        .mix(Theme.of(context).colorScheme.secondary, 20);
    final Color dividerColor = Theme.of(context)
        .scaffoldBackgroundColor
        .mix(Theme.of(context).colorScheme.secondary, 20);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              const Gap(6),
              UpvoteButton(
                post: post,
              ),
              const Gap(8),
              Container(
                width: 1,
                height: 30,
                color: dividerColor,
              ),
              const Gap(12),
              Icon(
                Icons.chat_outlined,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                size: 18,
              ),
              const Gap(12),
            ],
          ),
        ),
        const Spacer(),
        BookmarkButton(
          post: post,
        )
      ],
    );
  }
}
