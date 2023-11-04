import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/otp_body.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/custom_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/icon_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/page_title.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';

class OtpPage extends StatefulWidget {
  final String contact;
  const OtpPage({
    super.key,
    required this.contact,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return SystemOverlayWrapper(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: CustomIconButton(
            onPressed: () => context.go('/'),
          ),
          title: const PageTitle(
            title: "Verify",
            icon: Icons.task_alt_outlined,
          ),
        ),
        body: OtpBody(
          contact: widget.contact,
        ),
      ),
    );
  }
}
