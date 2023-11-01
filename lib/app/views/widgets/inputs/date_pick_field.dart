import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';

class DatePickField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? placeHolder;
  const DatePickField({
    super.key,
    required this.controller,
    this.validator,
    this.placeHolder = "Date of Birth",
  });

  @override
  State<DatePickField> createState() => _DatePickFieldState();
}

class _DatePickFieldState extends State<DatePickField> {
  final FocusNode focusNode = FocusNode();
  late Widget suffix;
  DateTime? currentDate;

  @override
  Widget build(BuildContext context) {
    suffix = suffixButton(onTap, Icons.edit_calendar_outlined,
        Theme.of(context).colorScheme.primary);
    return CustomField(
      readOnly: true,
      controller: widget.controller,
      validator: widget.validator ?? birthdayValidator,
      placeHolder: widget.placeHolder,
      icon: Icons.today_rounded,
      suffixIcon: suffix,
      focusNode: focusNode,
      onTap: onTap,
    );
  }

  void onTap() async {
    if (!mounted) return;
    DateTime now = DateTime.now();
    final DateTime? pickedDate = await showCustomDatePicker(
      context,
      currentDate ?? DateTime(now.year - 18, now.month, now.day),
    );
    setState(() {
      currentDate = pickedDate;
      widget.controller.text = currentDate == null
          ? ""
          : DateFormat('dd-MM-yyyy').format(currentDate!);
    });
  }
}
