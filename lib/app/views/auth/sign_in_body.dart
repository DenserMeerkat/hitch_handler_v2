import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_form.dart';
import 'package:hitch_handler_v2/app/views/template/body_template.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:provider/provider.dart';

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
  void dispose() {
    super.dispose();
    textController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: BodyTemplate(
        topSpacing: 45,
        illustration:
            Illustrations.renderSignIn(context, isDark(context), padding: 12),
        form: SignInForm(
          textController: textController,
          passController: passController,
        ),
      ),
    );
  }
}
