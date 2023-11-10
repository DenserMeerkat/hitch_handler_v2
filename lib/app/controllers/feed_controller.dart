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

  void fetchFeedPosts(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    IsLoading(true).dispatch(context);
    FeedResponseModel result;
    if (_isAdmin) {
      debugPrint("Admin Feed");
      result = await fetchFeedAdmin(_token, _domain);
    } else {
      debugPrint("Student Feed");
      result = await fetchFeed(_token);
    }

    if (context.mounted) IsLoading(false).dispatch(context);
    if (result.statusCode == 200) {
      scaffoldContext.hideCurrentMaterialBanner();
      scaffoldContext.hideCurrentSnackBar();
      if (result.feedData != null) {
        _feedProvider.updateFeedPosts(result.feedData!);
      }
    } else {
      if (context.mounted) {
        final MaterialBanner materialBanner = showCustomMaterialBanner(
          context,
          contentText: result.message,
        );
        scaffoldContext.hideCurrentMaterialBanner();
        scaffoldContext.showMaterialBanner(materialBanner);
      }
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
  }
}
