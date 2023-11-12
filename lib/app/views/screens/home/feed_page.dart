import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/feed_controller.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/post_card.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with AutomaticKeepAliveClientMixin {
  final scrollController = ScrollController();
  late FeedProvider feedProvider;
  late FeedController feedController;
  late UserProvider userProvider;
  List<FeedPostModel> posts = [];

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
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
    refreshPosts();
  }

  Future<void> refreshPosts() async {
    debugPrint("Refreshing Posts");
    final List<FeedPostModel> fetchedPosts =
        await feedController.fetchFeedPosts(context);
    setState(() {
      posts = fetchedPosts;
    });
  }

  Future<void> fetchMorePosts() async {
    debugPrint("Fetching More Posts");
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      final List<FeedPostModel> fetchedPosts =
          await feedController.fetchFeedPosts(context);
      setState(() {
        posts = fetchedPosts;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
                itemCount: posts.length + 1,
              ),
      ),
    );
  }
}
      // CustomScrollView(
      //   slivers: [
      //     posts.isEmpty
      //         ? const SliverFillRemaining(
      //             child: TempView(emptyText: "No Posts"),
      //           )
      //         : SliverList(
      //             delegate: SliverChildBuilderDelegate(
      //               (context, index) {
      //                 final post = posts[index];
      //                 return PostCard(
      //                   key: ValueKey(post.postid),
      //                   post: post,
      //                 );
      //               },
      //               childCount: posts.length,
      //             ),
      //           ),
      //   ],
      // ),
