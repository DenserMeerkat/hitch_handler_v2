// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
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
                const FittedBox(
                  child: Text(
                    "Welcome Back!",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FittedBox(
                  child: Text(
                    "Sign In to continue to app.",
                  ),
                ),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
