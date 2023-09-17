import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_form.dart';

class ThemePreview extends StatelessWidget {
  final BuildContext context;
  const ThemePreview({
    super.key,
    required this.controller,
    required this.context,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor.withOpacity(0.3),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          AbsorbPointer(
            child: Transform(
              alignment: Alignment.center,
              transform: Transform.scale(
                scale: 0.8,
              ).transform,
              child: SignInForm(
                textController: controller,
                passController: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
