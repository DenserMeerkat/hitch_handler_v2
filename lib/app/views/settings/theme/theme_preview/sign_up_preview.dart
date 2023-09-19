import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets.dart/preview_auth_bottom.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets.dart/preview_field.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets.dart/preview_header.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets.dart/preview_long_button.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets.dart/preview_template.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class SignUpPreview extends StatelessWidget {
  const SignUpPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return PreviewTemplate(
      header: PreviewHeader(
        context: context,
        title: "Sign Up",
        isDarkMode: isDarkMode,
        icon: Icons.person_add_rounded,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 26,
          ),
          Illustrations.renderSignUp(
            context,
            isDarkMode,
            height: 35,
            width: 30,
            padding: 8,
          ),
          const SizedBox(
            height: 2,
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
            prefixIcon: Icons.today_rounded,
            isDarkMode: isDarkMode,
            suffixIcon: Icons.edit_calendar_outlined,
            hintText: "Date of Birth",
          ),
          const SizedBox(
            height: 8,
          ),
          const PreviewLongFilledButton(
            label: "Let's get Started",
          ),
        ],
      ),
      footer: const PreviewAuthBottom(
        index: 1,
      ),
    );
  }
}
