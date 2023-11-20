import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/data/model/feed_post_model.dart';

class FeedProvider extends ChangeNotifier {
  List<FeedPostModel> _feedPosts = [];
  int _feedPostsCursor = 0;
  bool _hasMore = true;
  bool _isFeedPostsLoading = false;
  SortEnum _sortType = SortEnum.latest;

  List<FeedPostModel> get feedPosts => _feedPosts;
  int get feedPostsCursor => _feedPostsCursor;
  bool get hasMore => _hasMore;
  bool get isFeedPostsLoading => _isFeedPostsLoading;
  SortEnum get sortType => _sortType;

  void updateFeedPosts(List<FeedPostModel> feedPosts) {
    _feedPosts = feedPosts;
    notifyListeners();
  }

  void updateIsFeedPostsLoading(bool loading) {
    _isFeedPostsLoading = loading;
    notifyListeners();
  }

  void updateSortType(SortEnum sortType) {
    _sortType = sortType;
    notifyListeners();
  }

  void updateFeedPostsCursor(int cursor) {
    _feedPostsCursor = cursor;
    notifyListeners();
  }

  void updateHasMore(bool hasMore) {
    _hasMore = hasMore;
    notifyListeners();
  }
}
