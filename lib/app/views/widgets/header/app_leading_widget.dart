import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/appbar_icon_button.dart';

class AppLeadingWidget extends StatelessWidget {
  const AppLeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarIconButton(
      icon: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        ),
        child: const Text(
          "HH",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
