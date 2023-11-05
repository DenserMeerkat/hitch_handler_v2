import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/feed_controller.dart';
import 'package:hitch_handler_v2/app/views/home/feed/feed_flex.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/temp_view.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/post_card.dart';
import 'package:hitch_handler_v2/data/model/feed_post_model.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<FeedPostModel> posts = [];
  late FeedController _feedController;
  @override
  void initState() {
    super.initState();
    _feedController = FeedController(context.read<UserProvider>().jwtToken!);
    //fetchPosts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("Feed Page didChangeDependencies");
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final List<FeedPostModel> fetchedPosts =
        await _feedController.fetchFeedPosts(context);
    setState(() {
      posts = fetchedPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          primary: false,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 60,
          flexibleSpace: const FeedFlex(),
          bottom: bottomLine(context, height: 16),
        ),
        posts.isEmpty
            ? const SliverFillRemaining(
                child: TempView(emptyText: "No Posts"),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final post = posts[index];
                    return PostCard(
                      post: post,
                      key: ValueKey(post.postid),
                    );
                  },
                  childCount: posts.length,
                ),
              ),
      ],
    );
  }
}
