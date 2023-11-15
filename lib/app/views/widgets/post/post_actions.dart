import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tinycolor2/tinycolor2.dart';

class PostActions extends StatefulWidget {
  final FeedPostModel post;
  const PostActions({
    super.key,
    required this.post,
  });

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  bool isLiked = false;
  bool isBookmarked = false;
  int likeCount = 0;
  @override
  void initState() {
    super.initState();
    isLiked = false;
    isBookmarked = false;
    likeCount = 0;
  }

  Future<bool?> onLikeButtonTap(bool isLiked) async {
    setState(() {
      this.isLiked = !this.isLiked;
      if (this.isLiked) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
    return !isLiked;
  }

  Future<bool?> onBookmarkButtonTap(bool isBookmarked) async {
    setState(() {
      this.isBookmarked = !this.isBookmarked;
    });
    return !isBookmarked;
  }

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
              LikeButton(
                isLiked: isLiked,
                onTap: onLikeButtonTap,
                likeCount: likeCount,
                countBuilder: (likeCount, isLiked, text) {
                  return Text(
                    text,
                    style: TextStyle(
                      fontSize: 11,
                      color: isLiked
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                      fontWeight: isLiked ? FontWeight.w600 : null,
                    ),
                  );
                },
                likeCountPadding: const EdgeInsets.only(left: 0, right: 4),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Theme.of(context).colorScheme.primary,
                  dotSecondaryColor: Theme.of(context).colorScheme.secondary,
                  dotThirdColor: Theme.of(context).colorScheme.tertiary,
                  dotLastColor: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                circleColor: CircleColor(
                  start: Theme.of(context).colorScheme.primary,
                  end: Theme.of(context).colorScheme.secondary,
                ),
                likeBuilder: (isLiked) {
                  return Icon(
                    isLiked
                        ? MdiIcons.arrowUpBold
                        : MdiIcons.arrowUpBoldOutline,
                    color: isLiked
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                    size: 20,
                  );
                },
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
        LikeButton(
          isLiked: isBookmarked,
          onTap: onBookmarkButtonTap,
          bubblesColor: BubblesColor(
            dotPrimaryColor: Theme.of(context).colorScheme.secondary,
            dotSecondaryColor: Theme.of(context).colorScheme.tertiary,
            dotThirdColor: Theme.of(context).colorScheme.error,
            dotLastColor: Theme.of(context).colorScheme.errorContainer,
          ),
          circleColor: CircleColor(
            start: Theme.of(context).colorScheme.errorContainer,
            end: Theme.of(context).colorScheme.error,
          ),
          likeBuilder: (isBookmarked) {
            return Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
              color: isBookmarked
                  ? Theme.of(context)
                      .colorScheme
                      .error
                      .mix(Theme.of(context).colorScheme.errorContainer, 50)
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              size: 20,
            );
          },
        ),
      ],
    );
  }
}
