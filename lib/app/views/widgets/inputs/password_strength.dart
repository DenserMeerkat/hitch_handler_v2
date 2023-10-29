import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/utils/input_utils.dart';
import 'package:password_strength/password_strength.dart';

class PasswordStrength extends StatefulWidget {
  final TextEditingController passController;
  final double passStrength;
  final void Function(double) changeStrength;
  const PasswordStrength({
    super.key,
    required this.passController,
    required this.passStrength,
    required this.changeStrength,
  });

  @override
  State<PasswordStrength> createState() => _PasswordStrengthState();
}

class _PasswordStrengthState extends State<PasswordStrength> {
  @override
  void initState() {
    super.initState();
    widget.passController.addListener(() {
      updateStrength();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        LinearProgressIndicator(
          value: widget.passStrength != 0 ? widget.passStrength : 0.025,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
            getStrengthColor(context, widget.passStrength),
          ),
          minHeight: 6,
          borderRadius: BorderRadius.circular(5),
        ),
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceVariant,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 8,
                width: 80.w,
              ),
              renderDivider(context, 4),
              SizedBox(
                height: 8,
                width: 80.w,
              ),
              renderDivider(context, 2),
            ],
          ),
        ),
      ],
    );
  }

  VerticalDivider renderDivider(BuildContext context, double width) {
    return VerticalDivider(
      thickness: 2,
      width: width,
      color: Theme.of(context).colorScheme.surfaceVariant,
    );
  }

  void updateStrength() {
    double localStrength = widget.passStrength;
    if (!mounted) return;
    setState(() {
      localStrength = estimatePasswordStrength(widget.passController.text);
    });
    widget.changeStrength(localStrength);
  }
}
