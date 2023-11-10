import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/feed_controller.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/post_card.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late FeedController _feedController;
  List<FeedPostModel> posts = [];
  @override
  void initState() {
    super.initState();
    final UserProvider userProvider = context.read<UserProvider>();
    _feedController = FeedController(
      userProvider.jwtToken!,
      context,
      isAdmin: userProvider.userModel!.userType == UserEnum.admin,
      domain: userProvider.userModel!.domain,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    posts = context.watch<FeedProvider>().feedPosts;
    if (posts.isEmpty) {
      _feedController.fetchFeedPosts(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        posts.isEmpty
            ? const SliverFillRemaining(
                child: TempView(emptyText: "No Posts"),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final post = posts[index];
                    return PostCard(
                      key: ValueKey(post.postid),
                      post: post,
                    );
                  },
                  childCount: posts.length,
                ),
              ),
      ],
    );
  }
}
