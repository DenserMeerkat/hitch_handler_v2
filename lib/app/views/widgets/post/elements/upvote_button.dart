import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/controllers.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class UpvoteButton extends StatefulWidget {
  final FeedPostModel post;
  const UpvoteButton({
    super.key,
    required this.post,
  });

  @override
  State<UpvoteButton> createState() => _UpvoteButtonState();
}

class _UpvoteButtonState extends State<UpvoteButton>
    with AutomaticKeepAliveClientMixin {
  late FeedProvider feedProvider;
  late UserProvider userProvider;
  late UserModel user;
  late PostController postController;
  bool isLiked = false;
  int likeCount = 0;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
    feedProvider = context.read<FeedProvider>();
    user = userProvider.userModel!;
    postController = PostController(context);
    setLikedCount();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setLikedCount();
  }

  void setLikedCount() {
    FeedPostModel post = postController.getCurrentPostDetails(
        context, widget.post, feedProvider.feedPosts);
    likeCount = post.liked.length;
    isLiked = post.liked.contains(userProvider.userModel!.roll);
  }

  void updateLike(bool isLiked) async {
    isLoading.value = true;
    feedProvider.updateIsFeedPostsLoading(true);
    PostController postController = PostController(context);
    bool isSuccess = false;
    if (isLiked) {
      isSuccess = await postController.like(postController
          .getCurrentPostDetails(context, widget.post, feedProvider.feedPosts));
      if (isSuccess) {
        List<FeedPostModel> posts = feedProvider.feedPosts;
        for (int i = 0; i < posts.length; i++) {
          if (posts[i].postid == widget.post.postid) {
            FeedPostModel updatedPost = posts[i].copyWith(
              liked: [...posts[i].liked, user.roll!],
              likes: posts[i].liked.length + 1,
            );
            posts[i] = updatedPost;
            break;
          }
        }
        feedProvider.updateFeedPosts(posts);
        feedProvider.updateIsFeedPostsLoading(false);
      } else {
        if (!mounted) return;
        FeedPostModel post = postController.getCurrentPostDetails(
            context, widget.post, feedProvider.feedPosts);
        feedProvider.updateIsFeedPostsLoading(false);
        setState(() {
          likeCount = post.liked.length;
          isLiked = post.liked.contains(userProvider.userModel!.roll);
        });
      }
    } else {
      isSuccess = await postController.unLike(postController
          .getCurrentPostDetails(context, widget.post, feedProvider.feedPosts));
      if (isSuccess) {
        List<FeedPostModel> posts = feedProvider.feedPosts;
        for (int i = 0; i < posts.length; i++) {
          if (posts[i].postid == widget.post.postid) {
            FeedPostModel updatedPost = posts[i].copyWith(
              liked: [...posts[i].liked]..remove(user.roll),
              likes: posts[i].liked.length - 1,
            );
            posts[i] = updatedPost;
            break;
          }
        }
        feedProvider.updateFeedPosts(posts);
        feedProvider.updateIsFeedPostsLoading(false);
      } else {
        if (!mounted) return;
        FeedPostModel post = postController.getCurrentPostDetails(
            context, widget.post, feedProvider.feedPosts);
        feedProvider.updateIsFeedPostsLoading(false);
        setState(() {
          likeCount = post.liked.length;
          isLiked = post.liked.contains(userProvider.userModel!.roll);
        });
      }
    }
    isLoading.value = false;
  }

  Future<bool?> onLikeButtonTap(bool isLiked) async {
    if (isLoading.value) return !isLiked;
    this.isLiked = !isLiked;
    likeCount += isLiked ? 1 : -1;
    updateLike(!isLiked);
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder(
      valueListenable: isLoading,
      builder: (context, bool isLoading, child) {
        return AbsorbPointer(
          absorbing: isLoading || feedProvider.isFeedPostsLoading,
          child: child,
        );
      },
      child: LikeButton(
        isLiked: widget.post.liked.contains(userProvider.userModel!.roll),
        onTap: onLikeButtonTap,
        likeCount: likeCount,
        countBuilder: (likeCount, isLiked, text) {
          return Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: isLiked
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
            isLiked ? MdiIcons.arrowUpBold : MdiIcons.arrowUpBoldOutline,
            color: isLiked
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            size: 20,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
