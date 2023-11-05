import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';
import 'package:hitch_handler_v2/data/apis/fetch_feed_api.dart';
import 'package:hitch_handler_v2/data/model/models.dart';

class FeedController {
  late String _token;

  FeedController(String token) {
    _token = token;
  }

  Future<List<FeedPostModel>> fetchFeedPosts(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    IsLoading(true).dispatch(context);
    FeedResponseModel result;
    result = await fetchFeed(_token);

    if (context.mounted) IsLoading(false).dispatch(context);
    if (result.statusCode == 200) {
      scaffoldContext.hideCurrentMaterialBanner();
      scaffoldContext.hideCurrentSnackBar();
      return result.feedData ?? [];
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
}
