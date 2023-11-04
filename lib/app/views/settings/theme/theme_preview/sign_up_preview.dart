import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets/theme_preview_widgets.dart';
import 'package:hitch_handler_v2/app/views/template/preview_template.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

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
          const Gap(26),
          Illustrations.renderSignUp(
            context,
            isDarkMode,
            height: 35,
            width: 30,
            padding: 8,
          ),
          const Gap(2),
          PreviewField(
            prefixIcon: Icons.account_circle,
            isDarkMode: isDarkMode,
            suffixIcon: Icons.badge_outlined,
            hintText: "Roll Number",
          ),
          const Gap(6),
          PreviewField(
            prefixIcon: Icons.today_rounded,
            isDarkMode: isDarkMode,
            suffixIcon: Icons.edit_calendar_outlined,
            hintText: "Date of Birth",
          ),
          const Gap(8),
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
