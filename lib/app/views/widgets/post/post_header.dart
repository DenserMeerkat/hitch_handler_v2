import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/status_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/elements/admin_status_indicator.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/elements/status_indicator.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.post,
  });

  final FeedPostModel post;
  @override
  Widget build(BuildContext context) {
    final UserModel user = context.read<UserProvider>().userModel!;
    final bool isAdmin = user.userType == UserEnum.admin;
    final StatusEnum statusEnum =
        getStatusTypeFromString(post.currentstatus).statusEnum;
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
        isAdmin
            ? AdminStatusIndicator(statusEnum: statusEnum)
            : StatusIndicator(
                stateEnum: statusEnum,
              ),
      ],
    );
  }
}
