import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

class InputType {
  final String? Function(String?)? validator;
  final String placeHolder;
  final IconData suffixIcon;
  final TextInputType? keyboardType;
  const InputType({
    required this.placeHolder,
    required this.suffixIcon,
    required this.validator,
    this.keyboardType = TextInputType.emailAddress,
  });
}

class MultiFields {
  static const InputType email = InputType(
    placeHolder: "E-mail",
    suffixIcon: Icons.alternate_email_outlined,
    validator: emailValidator,
    keyboardType: TextInputType.emailAddress,
  );
  static const InputType mobile = InputType(
    placeHolder: "Phone",
    suffixIcon: Icons.phone_outlined,
    validator: phoneValidator,
    keyboardType: TextInputType.phone,
  );
  static const InputType roll = InputType(
    placeHolder: "Roll Number",
    suffixIcon: Icons.badge_outlined,
    validator: rollValidator,
    keyboardType: TextInputType.number,
  );

  List<InputType> get list => [roll, email, mobile];
  List<InputType> get listWithoutRoll => [email, mobile];
}
