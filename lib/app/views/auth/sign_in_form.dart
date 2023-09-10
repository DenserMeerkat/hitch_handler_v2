import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  _SignInFormState();

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
            const SizedBox(
              height: 20,
            ),
            const PasswordField(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UnderlineButton(
                  onPressed: () {},
                  label: "ForgotPassword?",
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            LongFilledButton(
              label: "Log into Account",
              icon: Icons.arrow_forward_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
