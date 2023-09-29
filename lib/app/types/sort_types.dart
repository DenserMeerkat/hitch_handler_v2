import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum SortEnum { upvote, latest }

class SortType {
  final SortEnum sortType;
  final Widget label;
  final IconData icon;
  final String title;
  const SortType({
    required this.sortType,
    required this.label,
    required this.icon,
    required this.title,
  });
}

SortType getSortType(SortEnum sortEnum) {
  return sortTypes.firstWhere((element) => element.sortType == sortEnum);
}

final List<SortType> sortTypes = <SortType>[
  const SortType(
    sortType: SortEnum.latest,
    label: Text('Latest'),
    icon: Icons.history_outlined,
    title: 'Latest',
  ),
  SortType(
    sortType: SortEnum.upvote,
    label: const Text('Upvote'),
    icon: MdiIcons.arrowUpBoldOutline,
    title: 'Upvote',
  ),
];
