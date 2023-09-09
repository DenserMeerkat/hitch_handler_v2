// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/password_field.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
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
                Illustrations.renderSignUp(context),
                SizedBox(
                  height: 20.h,
                ),
                MultiField(),
                SizedBox(
                  height: 20,
                ),
                PasswordField(),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
