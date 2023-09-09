import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreVert extends StatefulWidget {
  const MoreVert({super.key});

  @override
  State<MoreVert> createState() => _MoreVertState();
}

class _MoreVertState extends State<MoreVert> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.push('/themesettings'),
      icon: Icon(
        Icons.more_vert_rounded,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
      ),
      tooltip: "Settings",
    );
  }
}
