import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsButton extends StatefulWidget {
  final String settingsPath;
  const SettingsButton({
    super.key,
    this.settingsPath = '/settings',
  });

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.push(widget.settingsPath),
      icon: Icon(
        Icons.settings_outlined,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
      ),
      tooltip: "Settings",
    );
  }
}
