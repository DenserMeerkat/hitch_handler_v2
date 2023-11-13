enum StatusEnum {
  opened,
  duplicate,
  working,
  completed,
  closed,
}

extension StatusEnumExtension on StatusEnum {
  String get name {
    switch (this) {
      case StatusEnum.opened:
        return 'opened';
      case StatusEnum.working:
        return 'working';
      case StatusEnum.completed:
        return 'completed';
      case StatusEnum.closed:
        return 'closed';
      default:
        return 'inProgress';
    }
  }
}
