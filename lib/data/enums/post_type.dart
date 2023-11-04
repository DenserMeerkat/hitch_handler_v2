enum PostTypeEnum { public, private }

extension PostTypeEnumExtension on PostTypeEnum {
  String get name {
    switch (this) {
      case PostTypeEnum.public:
        return 'public';
      case PostTypeEnum.private:
        return 'private';
      default:
        return 'public';
    }
  }
}
