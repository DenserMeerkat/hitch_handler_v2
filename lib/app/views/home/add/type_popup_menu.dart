import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/template/popup_menu.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/providers/post_provider.dart';

class TypePopupMenu extends AbstractPopupMenu<PostType, PostTypeEnum> {
  final PostProvider postProvider;
  final bool enabled;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  const TypePopupMenu({
    super.key,
    required this.postProvider,
    this.enabled = true,
    this.borderRadius,
    this.padding,
  }) : super(
          isEnabled: enabled,
          buttonBorderRadius: borderRadius,
          buttonPadding: padding,
          dividerHeight: 30,
        );

  @override
  void updateSelectedItem(PostTypeEnum itemEnum) {
    postProvider.updateTypeEnum(itemEnum);
  }

  @override
  List<PostType> getItems() {
    return postTypes;
  }

  @override
  PostType getSelectedItem() {
    return getPostType(postProvider.type);
  }

  @override
  IconData getIconData(PostTypeEnum itemEnum) {
    return getPostType(itemEnum).icon;
  }

  @override
  String getItemTitle(PostTypeEnum itemEnum) {
    return getPostType(itemEnum).title;
  }

  @override
  PostTypeEnum getNoneValue() {
    return PostTypeEnum.public;
  }

  @override
  PostTypeEnum getEnum(PostType item) {
    return item.postTypeEnum;
  }
}
