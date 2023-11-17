import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/profile_utils.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  const ProfileAvatar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context)
            .colorScheme
            .primary
            .withOpacity(isDarkMode ? 0.2 : 0.3),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Text(
        getInitials(name),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
