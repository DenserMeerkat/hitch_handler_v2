import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:like_button/like_button.dart';
import 'package:tinycolor2/tinycolor2.dart';

class BookmarkButton extends StatefulWidget {
  final FeedPostModel post;
  const BookmarkButton({
    super.key,
    required this.post,
  });

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;
  @override
  void initState() {
    super.initState();
    isBookmarked = false;
  }

  Future<bool?> onBookmarkButtonTap(bool isBookmarked) async {
    setState(() {
      this.isBookmarked = !this.isBookmarked;
    });
    return !isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return LikeButton(
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
    );
  }
}
