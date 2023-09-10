import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/long_filled_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/password_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/uni_field.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController rollController;
  final TextEditingController dateController;
  const SignUpForm({
    super.key,
    required this.rollController,
    required this.dateController,
  });
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  _SignUpFormState();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            UniField(
              icon: Icons.account_circle,
              controller: widget.rollController,
              type: MultiFields.roll,
            ),
            const SizedBox(
              height: 20,
            ),
            const PasswordField(),
            SizedBox(
              height: 30.h,
            ),
            LongFilledButton(
              label: "Let's Get Started",
              icon: Icons.double_arrow_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
