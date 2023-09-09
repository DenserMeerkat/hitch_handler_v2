// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/password_field.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          loading ? const LinearProgressIndicator() : Container(height: 4),
          Container(
            constraints: const BoxConstraints(maxWidth: 380),
            padding: EdgeInsets.only(
              left: 30.w,
              right: 30.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Illustrations.renderSignIn(context),
                SizedBox(
                  height: 20.h,
                ),
                const MultiField(),
                const SizedBox(
                  height: 20,
                ),
                const PasswordField(),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
