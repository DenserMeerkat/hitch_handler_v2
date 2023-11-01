String getInitials(String name) {
  List<String> nameParts = name.split(' ');
  String initials = '';

  for (var part in nameParts) {
    if (part.isNotEmpty) {
      initials += part[0].toUpperCase();
      if (initials.length >= 2) {
        break;
      }
    }
  }

  return initials.isNotEmpty ? initials : name[0].toUpperCase();
}
