import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/confirm_pass_body.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/custom_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/page_title.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({
    super.key,
  });

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
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
          onPressed: () {},
        ),
      ),
    );
  }
}
