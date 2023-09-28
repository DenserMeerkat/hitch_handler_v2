import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_up_form.dart';
import 'package:hitch_handler_v2/app/views/template/body_template.dart';
import 'package:hitch_handler_v2/app/types/illustrations.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final rollController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    rollController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      illustration: Illustrations.renderSignUp(context, isDark(context)),
      topSpacing: 70,
      form: SignUpForm(
        rollController: rollController,
        dateController: dateController,
      ),
    );
  }
}
