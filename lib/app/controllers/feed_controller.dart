import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';
import 'package:hitch_handler_v2/data/apis/fetch_feed_api.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/feed_provider.dart';
import 'package:provider/provider.dart';

class FeedController {
  late FeedProvider _feedProvider;
  late String _token;
  late bool _isAdmin;
  late String _domain;

  FeedController(String token, BuildContext context,
      {bool isAdmin = false, String domain = ""}) {
    _feedProvider = context.read<FeedProvider>();
    _token = token;
    _isAdmin = isAdmin;
    _domain = domain;
  }

  Future<List<FeedPostModel>> fetchFeedPosts(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    final int cursor = _feedProvider.feedPostsCursor;
    IsLoading(true).dispatch(context);
    FeedResponseModel result;
    if (_isAdmin) {
      debugPrint("Admin Feed");
      result = await fetchFeedAdmin(_token, _domain, cursor: cursor);
    } else {
      debugPrint("Student Feed");
      result = await fetchFeed(_token, cursor: cursor);
    }
    debugPrint(result.toString());
    if (context.mounted) IsLoading(false).dispatch(context);
    if (result.statusCode == 200) {
      scaffoldContext.hideCurrentMaterialBanner();
      scaffoldContext.hideCurrentSnackBar();
      if (result.feedData != null) {
        List<FeedPostModel> posts = _feedProvider.feedPosts + result.feedData!;
        final uniquePosts = posts.toSet().toList();
        log(posts.toString());
        _feedProvider.updateFeedPosts(uniquePosts);
        _feedProvider.updateFeedPostsCursor(result.cursor);
        return uniquePosts;
      }
      return [];
    } else {
      if (context.mounted) {
        final MaterialBanner materialBanner = showCustomMaterialBanner(
          context,
          contentText: result.message,
        );
        scaffoldContext.hideCurrentMaterialBanner();
        scaffoldContext.showMaterialBanner(materialBanner);
      }
      return [];
    }
  }

  reset() {
    debugPrint("Resetting FeedProvider");
    _feedProvider.updateFeedPosts([]);
    _feedProvider.updateUserPosts([]);
    _feedProvider.updateBookmarkedPosts([]);
    _feedProvider.updateIsFeedPostsLoading(false);
    _feedProvider.updateIsUserPostsLoading(false);
    _feedProvider.updateIsBookmarkedPostsLoading(false);
    _feedProvider.updateFeedPostsCursor(0);
  }
}
