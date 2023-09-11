// Flutter imports:
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/string_extenstions.dart';
import 'package:hitch_handler_v2/app/views/auth/otp_countdown.dart';
import 'package:hitch_handler_v2/app/views/template/body_template.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/long_filled_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/otp_field.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';

class OtpBody extends StatefulWidget {
  final String contact;
  const OtpBody({
    super.key,
    required this.contact,
  });

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    pinController.addListener(_updateButtonEnabledState);
  }

  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      illustration: Illustrations.renderOtp(context),
      form: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              OtpMessage(contact: widget.contact),
              const SizedBox(
                height: 10,
              ),
              const OtpCountdown(),
              const SizedBox(
                height: 20,
              ),
              OtpField(
                pinController: pinController,
                focusNode: focusNode,
              ),
              const SizedBox(
                height: 20,
              ),
              LongFilledButton(
                enabled: isButtonEnabled,
                label: "Verify OTP",
                icon: Icons.arrow_forward_rounded,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateButtonEnabledState() {
    setState(() {
      isButtonEnabled = pinController.text.length == 6;
    });
  }
}

class OtpMessage extends StatelessWidget {
  const OtpMessage({
    super.key,
    required this.contact,
  });

  final String contact;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "An OTP has been sent to",
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            semanticsLabel: "Contact to which OTP has been sent",
            text: " ${contact.obscureContact()}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
