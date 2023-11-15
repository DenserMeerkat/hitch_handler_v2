import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/elements/status_indicator.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.post,
  });

  final FeedPostModel post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .tertiaryContainer
                .withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.domain,
                size: 12,
              ),
              Container(
                width: 1,
                height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Text(
                post.domain,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 200.w,
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                StatusIndicator(
                  stateEnum: StatusEnum.opened,
                ),
                Gap(5),
                StatusIndicator(
                  stateEnum: StatusEnum.duplicate,
                ),
                Gap(5),
                StatusIndicator(
                  stateEnum: StatusEnum.working,
                ),
                Gap(5),
                StatusIndicator(
                  stateEnum: StatusEnum.completed,
                ),
                Gap(5),
                StatusIndicator(
                  stateEnum: StatusEnum.closed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
