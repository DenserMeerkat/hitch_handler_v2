import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/template/popup_menu.dart';
import 'package:hitch_handler_v2/providers/providers.dart';

class FeedTitlePopupMenu extends AbstractPopupMenu<SortType, SortEnum> {
  final FeedProvider feedProvider;
  final bool enabled;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final String? feedTitle;
  final Color? popupBackgroundColor;
  final Color? popupBorderColor;
  final Color? popupDividerColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? dividerColor;
  const FeedTitlePopupMenu({
    super.key,
    required this.feedProvider,
    this.enabled = true,
    this.borderRadius,
    this.padding,
    this.feedTitle,
    this.popupBackgroundColor,
    this.popupBorderColor,
    this.popupDividerColor,
    this.backgroundColor,
    this.borderColor,
    this.dividerColor,
  }) : super(
          iconSize: 18,
          dividerHeight: 34,
          showIcon: true,
          showTitle: true,
          titleStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          isEnabled: enabled,
          buttonBorderRadius: borderRadius,
          buttonPadding: padding,
          popupMenuColor: popupBackgroundColor,
          popupMenuBorderColor: popupBorderColor,
          popupMenuDividerColor: popupDividerColor,
          popupChildColor: backgroundColor,
          popupChildBorderColor: borderColor,
          popupChildDividerColor: dividerColor,
          title: feedTitle,
        );

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
