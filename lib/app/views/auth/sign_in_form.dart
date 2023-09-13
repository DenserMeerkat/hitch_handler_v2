import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/utils/inputs/validators.dart';
import 'package:hitch_handler_v2/app/views/auth/forgot_sheet.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/long_filled_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/underline_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/password_field.dart';

class SignInForm extends StatefulWidget {
  final TextEditingController textController;
  final TextEditingController passController;
  const SignInForm({
    super.key,
    required this.textController,
    required this.passController,
  });
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MultiField(
              controller: widget.textController,
            ),
            SizedBox(
              height: 10.h,
            ),
            PasswordField(
              controller: widget.passController,
              validator: lengthValidator,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UnderlineButton(
                  onPressed: () {
                    showForgotSheet(context);
                  },
                  label: "Forgot Password?",
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            LongFilledButton(
              label: "Log into Account",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("Sign In Validated");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
