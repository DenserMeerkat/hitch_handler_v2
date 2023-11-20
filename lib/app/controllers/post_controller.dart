import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/apis/like_post_api.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class PostController {
  late UserProvider _userProvider;

  PostController(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  Future<bool> like(FeedPostModel post) async {
    ResponseModel result;
    result = await likePost(post.postid, _userProvider.jwtToken!);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> unLike(FeedPostModel post) async {
    ResponseModel result;
    result = await unLikePost(post.postid, _userProvider.jwtToken!);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  FeedPostModel getCurrentPostDetails(
      BuildContext context, FeedPostModel post, List<FeedPostModel> posts) {
    for (int i = 0; i < posts.length; i++) {
      if (posts[i].postid == post.postid) {
        return posts[i];
      }
    }
    debugPrint("Post Not Found");
    return post;
  }
}
