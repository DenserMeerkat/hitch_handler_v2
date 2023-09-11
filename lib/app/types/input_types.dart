import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/inputs/validators.dart';

class MultiFields {
  static const FieldType email = FieldType(
    placeHolder: "E-mail",
    suffixIcon: Icons.alternate_email,
    validator: emailValidator,
    keyboardType: TextInputType.emailAddress,
  );
  static const FieldType mobile = FieldType(
    placeHolder: "Phone",
    suffixIcon: Icons.phone,
    validator: phoneValidator,
    keyboardType: TextInputType.phone,
  );
  static const FieldType roll = FieldType(
    placeHolder: "Roll Number",
    suffixIcon: Icons.badge,
    validator: phoneValidator,
    keyboardType: TextInputType.number,
  );

  List<FieldType> get list => [roll, email, mobile];
  List<FieldType> get listWithoutRoll => [email, mobile];
}

class FieldType {
  final String? Function(String?)? validator;
  final String placeHolder;
  final IconData suffixIcon;
  final TextInputType? keyboardType;
  const FieldType({
    required this.placeHolder,
    required this.suffixIcon,
    required this.validator,
    this.keyboardType = TextInputType.emailAddress,
  });
}
