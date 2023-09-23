import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_form.dart';
import 'package:hitch_handler_v2/app/views/template/body_template.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final textController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      topSpacing: 45,
      illustration:
          Illustrations.renderSignIn(context, isDark(context), padding: 12),
      form: SignInForm(
        textController: textController,
        passController: passController,
      ),
    );
  }
}
