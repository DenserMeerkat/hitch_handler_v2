import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/post_types.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class PostController {
  late PostProvider _postProvider;

  PostController(BuildContext context) {
    _postProvider = Provider.of<PostProvider>(context, listen: true);
  }

  addPost(BuildContext context) async {}

  bool isFromValid() {
    if (_postProvider.title?.isEmpty ?? true) return false;
    if (_postProvider.description?.isEmpty ?? true) return false;
    if (_postProvider.domain == DomainEnum.none) return false;
    return true;
  }

  reset() {
    _postProvider.updateTitle('');
    _postProvider.updateDescription('');
    _postProvider.updateType(postTypes[0]);
    _postProvider.updateLocation(LocationEnum.none);
    _postProvider.updateDomain(DomainEnum.none);
  }

  updateLocation(LocationEnum location) {
    _postProvider.updateLocation(location);
  }

  updateDomain(DomainEnum domain) {
    _postProvider.updateDomain(domain);
  }
}
