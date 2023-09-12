// Flutter imports:
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_form.dart';
import 'package:hitch_handler_v2/app/views/template/body_template.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody>
    with AutomaticKeepAliveClientMixin<SignInBody> {
  final textController = TextEditingController();
  final passController = TextEditingController();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BodyTemplate(
      illustration: Illustrations.renderSignIn(context),
      form: SignInForm(
        textController: textController,
        passController: passController,
      ),
    );
  }
}
