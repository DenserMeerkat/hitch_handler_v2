import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';

class PasswordValidator extends StatefulWidget {
  final TextEditingController passController;
  final TextEditingController confPassController;
  const PasswordValidator({
    super.key,
    required this.passController,
    required this.confPassController,
  });

  @override
  State<PasswordValidator> createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  double passStrength = 0.025;
  String stateText = "Choose a Strong Password";
  late Color stateColor = Theme.of(context).colorScheme.error;
  @override
  void initState() {
    super.initState();
    widget.passController.addListener(() {
      updateState();
    });
    widget.confPassController.addListener(() {
      updateState();
    });
  }

  void updateState() {
    if (!mounted) return;
    setState(() {
      if (passStrength < 0.3) {
        stateColor = getStrengthColor(context, passStrength);
        stateText = "Choose a Strong Password";
      } else if (passStrength < 0.6) {
        stateColor = getStrengthColor(context, passStrength);
        stateText = "Choose a Stronger Password";
      } else if (widget.confPassController.text.isNotEmpty &&
          widget.confPassController.text != widget.passController.text) {
        stateColor = Theme.of(context).colorScheme.error;
        stateText = "Passwords don't match";
      } else if (passStrength >= 0.6 &&
          widget.confPassController.text.isEmpty) {
        stateColor = getStrengthColor(context, passStrength);
        stateText = "Strong password chosen";
      } else {
        stateColor = Theme.of(context).colorScheme.primary;
        stateText = "Passwords match";
      }
    });
  }

  void changeStrength(double strength) {
    if (!mounted) return;
    setState(() {
      passStrength = strength;
    });
    debugPrint("Strength: $strength");
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    updateState();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PasswordStrength(
            passController: widget.passController,
            passStrength: passStrength,
            changeStrength: changeStrength,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            stateText,
            style: TextStyle(
              color: stateColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }
}
