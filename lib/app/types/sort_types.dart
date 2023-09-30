import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum SortEnum { none, upvote, latest }

class SortType {
  final SortEnum sortEnum;
  final Widget label;
  final IconData icon;
  final String title;
  const SortType({
    required this.sortEnum,
    required this.label,
    required this.icon,
    required this.title,
  });
}

SortType getSortType(SortEnum sortEnum) {
  return sortTypes.firstWhere((element) => element.sortEnum == sortEnum);
}

final List<SortType> sortTypes = <SortType>[
  const SortType(
    sortEnum: SortEnum.latest,
    label: Text('Latest'),
    icon: Icons.history_outlined,
    title: 'Latest',
  ),
  SortType(
    sortEnum: SortEnum.upvote,
    label: const Text('Upvote'),
    icon: MdiIcons.arrowUpBoldOutline,
    title: 'Upvote',
  ),
];
