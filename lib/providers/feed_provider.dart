import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/data/model/feed_post_model.dart';

class FeedProvider extends ChangeNotifier {
  List<FeedPostModel> _feedPosts = [];
  List<FeedPostModel> _userPosts = [];
  List<FeedPostModel> _bookmarkedPosts = [];
  int _feedPostsCursor = 0;
  bool _isFeedPostsLoading = false;
  bool _isUserPostsLoading = false;
  bool _isBookmarkedPostsLoading = false;
  SortEnum _sortType = SortEnum.latest;

  List<FeedPostModel> get feedPosts => _feedPosts;
  List<FeedPostModel> get userPosts => _userPosts;
  List<FeedPostModel> get bookmarkedPosts => _bookmarkedPosts;
  int get feedPostsCursor => _feedPostsCursor;
  bool get isFeedPostsLoading => _isFeedPostsLoading;
  bool get isUserPostsLoading => _isUserPostsLoading;
  bool get isBookmarkedPostsLoading => _isBookmarkedPostsLoading;
  SortEnum get sortType => _sortType;

  void updateFeedPosts(List<FeedPostModel> feedPosts) {
    _feedPosts = feedPosts;
    notifyListeners();
  }

  void updateUserPosts(List<FeedPostModel> userPosts) {
    _userPosts = userPosts;
    notifyListeners();
  }

  void updateBookmarkedPosts(List<FeedPostModel> bookmarkedPosts) {
    _bookmarkedPosts = bookmarkedPosts;
    notifyListeners();
  }

  void updateIsFeedPostsLoading(bool loading) {
    _isFeedPostsLoading = loading;
    notifyListeners();
  }

  void updateIsUserPostsLoading(bool loading) {
    _isUserPostsLoading = loading;
    notifyListeners();
  }

  void updateIsBookmarkedPostsLoading(bool loading) {
    _isBookmarkedPostsLoading = loading;
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
}
