import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';

class PostType {
  final PostTypeEnum postTypeEnum;
  final Widget label;
  final IconData icon;
  final String title;
  const PostType({
    required this.postTypeEnum,
    required this.label,
    required this.icon,
    required this.title,
  });
}

PostType getPostType(PostTypeEnum postTypeEnum) {
  return postTypes
      .firstWhere((element) => element.postTypeEnum == postTypeEnum);
}

final List<PostType> postTypes = <PostType>[
  const PostType(
    postTypeEnum: PostTypeEnum.public,
    label: Text('Public'),
    icon: Icons.public_outlined,
    title: 'Public',
  ),
  const PostType(
    postTypeEnum: PostTypeEnum.private,
    label: Text('Private'),
    icon: Icons.lock_outlined,
    title: 'Private',
  ),
];
