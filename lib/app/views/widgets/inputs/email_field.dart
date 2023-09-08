import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/app/utils/inputs/validators.dart';
import 'custom_field.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late Widget suffix = suffixIcon(
    Icons.alternate_email_outlined,
  );
  @override
  void initState() {
    super.initState();
    emailController.addListener(_onStateChange);
    focusNode.addListener(() {
      _onStateChange();
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  void _onStateChange() {
    if (emailController.text.isNotEmpty && focusNode.hasFocus) {
      setState(() {
        suffix = clearButton(emailController);
      });
    } else {
      setState(() {
        suffix = suffixIcon(Icons.alternate_email_outlined);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      controller: emailController,
      validator: emailValidator,
      placeHolder: "Email",
      keyboardType: TextInputType.emailAddress,
      icon: Icons.account_circle,
      suffixIcon: suffix,
      focusNode: focusNode,
    );
  }
}
