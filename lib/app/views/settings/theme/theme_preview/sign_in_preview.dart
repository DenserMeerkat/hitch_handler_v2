import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets/theme_preview_widgets.dart';
import 'package:hitch_handler_v2/app/views/template/preview_template.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

class SignInPreview extends StatelessWidget {
  const SignInPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return PreviewTemplate(
      header: PreviewHeader(
        context: context,
        title: "Sign In",
        isDarkMode: isDarkMode,
        icon: Icons.person_rounded,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Illustrations.renderSignIn(
            context,
            isDarkMode,
            height: 40,
            width: 30,
            padding: 8,
          ),
          const SizedBox(
            height: 6,
          ),
          PreviewField(
            prefixIcon: Icons.account_circle,
            isDarkMode: isDarkMode,
            suffixIcon: Icons.badge_outlined,
            hintText: "Roll Number",
          ),
          const SizedBox(
            height: 6,
          ),
          PreviewField(
            prefixIcon: Icons.password,
            isDarkMode: isDarkMode,
            suffixIcon: Icons.visibility_outlined,
            hintText: "Password",
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 60,
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 2,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const PreviewLongFilledButton(
            label: "Log into Account",
          ),
        ],
      ),
      footer: const PreviewAuthBottom(),
    );
  }
}
