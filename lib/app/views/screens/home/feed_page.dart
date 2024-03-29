import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/feed_controller.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/post_card.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final scrollController = ScrollController();
  late FeedProvider feedProvider;
  late FeedController feedController;
  late UserProvider userProvider;
  List<FeedPostModel> posts = [];
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
    feedProvider = context.read<FeedProvider>();
    feedController = FeedController(
      userProvider.jwtToken!,
      context,
      isAdmin: userProvider.userModel!.userType == UserEnum.admin,
      domain: userProvider.userModel!.domain,
    );
    scrollController.addListener(fetchMorePosts);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (feedProvider.feedPosts.isEmpty) {
      refreshPosts();
    } else {
      posts = feedProvider.feedPosts;
    }
  }

  Future<void> refreshPosts() async {
    if (feedProvider.isFeedPostsLoading) return;
    feedProvider.updateIsFeedPostsLoading(true);
    debugPrint("Refreshing Posts");
    final List<FeedPostModel> fetchedPosts =
        await feedController.fetchFeedPosts(context);
    setState(() {
      posts = fetchedPosts;
    });
    feedProvider.updateIsFeedPostsLoading(false);
  }

  Future<void> fetchMorePosts() async {
    debugPrint("Fetching More Posts");
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (feedProvider.isFeedPostsLoading || !hasMore) return;
      feedProvider.updateIsFeedPostsLoading(true);
      final List<FeedPostModel> fetchedPosts =
          await feedController.fetchFeedPosts(context);
      if (fetchedPosts.length - posts.length < feedPageSize) {
        setState(() {
          hasMore = false;
        });
      }
      setState(() {
        posts = fetchedPosts;
      });
      feedProvider.updateIsFeedPostsLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: RefreshIndicator(
        onRefresh: refreshPosts,
        child: posts.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (index < posts.length) {
                    final post = posts[index];
                    return PostCard(
                      key: ValueKey(post.postid),
                      post: post,
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: hasMore
                            ? const CircularProgressIndicator()
                            : const Text("You have reached end."),
                      ),
                    );
                  }
                },
                itemCount: posts.length + 1,
              ),
      ),
    );
  }
}
