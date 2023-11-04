import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/confirm_pass_body.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/custom_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/icon_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/page_title.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SystemOverlayWrapper(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: CustomIconButton(
            onPressed: () => context.go('/'),
          ),
          title: const PageTitle(
            title: "Password",
            icon: Icons.key,
          ),
        ),
        body: ConfirmPassBody(
          placeholder1: "New Password",
          buttonLabel: "Reset Password",
          onPressed: () {},
        ),
      ),
    );
  }
}
