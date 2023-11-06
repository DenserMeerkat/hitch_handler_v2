import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/template/popup_menu.dart';
import 'package:hitch_handler_v2/providers/providers.dart';

class SortPopupMenu extends AbstractPopupMenu<SortType, SortEnum> {
  final FeedProvider feedProvider;

  const SortPopupMenu({
    super.key,
    required this.feedProvider,
  });

  @override
  void updateSelectedItem(SortEnum itemEnum) {
    feedProvider.updateSortType(itemEnum);
  }

  @override
  List<SortType> getItems() {
    return sortTypes;
  }

  @override
  SortType getSelectedItem() {
    return getSortType(feedProvider.sortType);
  }

  @override
  IconData getIconData(SortEnum itemEnum) {
    return getSortType(itemEnum).icon;
  }

  @override
  String getItemTitle(SortEnum itemEnum) {
    return getSortType(itemEnum).title;
  }

  @override
  SortEnum getNoneValue() {
    return SortEnum.none;
  }

  @override
  SortEnum getEnum(SortType item) {
    return item.sortEnum;
  }
}
