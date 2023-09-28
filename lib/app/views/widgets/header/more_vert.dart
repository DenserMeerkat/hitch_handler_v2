import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreVert extends StatefulWidget {
  final String settingsPath;
  const MoreVert({
    super.key,
    this.settingsPath = '/settings',
  });

  @override
  State<MoreVert> createState() => _MoreVertState();
}

class _MoreVertState extends State<MoreVert> {
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
