import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/otp_preview.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/sign_in_preview.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/sign_up_preview.dart';

class ThemePreview extends StatelessWidget {
  const ThemePreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(15.w),
          const SignInPreview(),
          const Gap(18),
          const OtpPreview(),
          const Gap(18),
          const SignUpPreview(),
          Gap(15.w),
        ],
      ),
    );
  }
}
