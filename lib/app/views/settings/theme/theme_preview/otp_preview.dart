import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/widgets/theme_preview_widgets.dart';
import 'package:hitch_handler_v2/app/views/template/preview_template.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

class OtpPreview extends StatelessWidget {
  const OtpPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    const String contact = "hitch.handler@gmail.com";
    return PreviewTemplate(
      header: PreviewHeader(
        context: context,
        title: "Verify",
        isDarkMode: isDarkMode,
        icon: Icons.task_alt_outlined,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(20),
          Illustrations.renderOtp(
            context,
            isDarkMode,
            height: 35,
            width: 40,
            padding: 8,
          ),
          const Gap(12),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 60,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "An OTP has been sent to",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 2),
                    children: <TextSpan>[
                      TextSpan(
                        semanticsLabel: "Contact to which OTP has been sent",
                        text: " ${contact.obscureContact()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 2,
                        letterSpacing: 0.3,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const Gap(4),
                    Container(
                      alignment: Alignment.center,
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 0.3,
                        ),
                      ),
                      child: Text(
                        "03",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 1,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(6),
          const PreviewOtpField(),
          const Gap(8),
          const PreviewLongFilledButton(
            label: "Verify OTP",
          ),
        ],
      ),
    );
  }
}
