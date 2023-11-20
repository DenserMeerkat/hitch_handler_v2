import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/theme/code_theme.dart';

class StatusType {
  final StatusEnum statusEnum;
  final Widget label;
  final IconData icon;
  final String title;
  const StatusType({
    required this.statusEnum,
    required this.label,
    required this.icon,
    required this.title,
  });
}

StatusType getStatusType(StatusEnum statusEnum) {
  return statusTypes.firstWhere((element) => element.statusEnum == statusEnum);
}

StatusType getStatusTypeFromString(String status) {
  return statusTypes
      .firstWhere((element) => element.title.toLowerCase() == status);
}

final List<StatusType> statusTypes = <StatusType>[
  const StatusType(
    statusEnum: StatusEnum.opened,
    label: Text('Opened'),
    icon: Icons.radio_button_checked,
    title: 'Opened',
  ),
  const StatusType(
    statusEnum: StatusEnum.duplicate,
    label: Text('Duplicate'),
    icon: Icons.copy_all_rounded,
    title: 'Duplicate',
  ),
  const StatusType(
    statusEnum: StatusEnum.working,
    label: Text('Working'),
    icon: Icons.construction_rounded,
    title: 'Working',
  ),
  const StatusType(
    statusEnum: StatusEnum.completed,
    label: Text('Completed'),
    icon: Icons.task_alt_rounded,
    title: 'Completed',
  ),
  const StatusType(
    statusEnum: StatusEnum.closed,
    label: Text('Closed'),
    icon: Icons.do_not_disturb_on_rounded,
    title: 'Closed',
  ),
];

Color getStatusColor(BuildContext context, StatusEnum statusEnum) {
  switch (statusEnum) {
    case StatusEnum.opened:
      return Theme.of(context).extension<CodeTheme>()!.numberColor!;
    case StatusEnum.duplicate:
      return Theme.of(context).extension<CodeTheme>()!.keywordColor!;
    case StatusEnum.working:
      return Theme.of(context).extension<CodeTheme>()!.stringColor!;
    case StatusEnum.completed:
      return Theme.of(context).extension<CodeTheme>()!.commentColor!;
    case StatusEnum.closed:
      return Theme.of(context).extension<CodeTheme>()!.baseColor!;
    default:
      return Theme.of(context).extension<CodeTheme>()!.baseColor!;
  }
}
