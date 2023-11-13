import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/post_actions.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/post_header.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/feed_post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatefulWidget {
  final FeedPostModel post;
  final PostTypeEnum postType;
  const PostCard({
    Key? key,
    required this.post,
    this.postType = PostTypeEnum.public,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            PostHeader(post: widget.post),
            const Gap(8),
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(6),
            ExpandableText(
              widget.post.desc,
              expandText: 'show more',
              collapseText: 'show less',
              maxLines: 3,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              animation: true,
              linkColor: Theme.of(context).primaryColor,
            ),
            const Gap(16),
            if (widget.postType == PostTypeEnum.public)
              PostActions(
                post: widget.post,
              ),
            const Gap(8),
            if (widget.post.location.isNotEmpty) Text(widget.post.location),
            const Gap(16),
            Text(
              timeago.format(widget.post.createdAt),
              style: TextStyle(
                fontSize: 11,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
