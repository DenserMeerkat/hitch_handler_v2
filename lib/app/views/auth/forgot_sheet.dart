import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/long_filled_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/bottom_sheet.dart';
import 'package:hitch_handler_v2/theme/illustrations.dart';

void showForgotSheet(BuildContext context) {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

  final TextEditingController controller = TextEditingController();
  showCustomModalBottomSheet(
    context,
    ForgotSheet(
      controller: controller,
    ),
  );
}

class ForgotSheet extends StatefulWidget {
  final TextEditingController controller;
  const ForgotSheet({super.key, required this.controller});

  @override
  State<ForgotSheet> createState() => _ForgotSheetState();
}

class _ForgotSheetState extends State<ForgotSheet> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHeader(
            title: "Forgot Password?",
          ),
          const Divider(
            thickness: 2,
            height: 2,
          ),
          isLoading ? const LProgressIndicator() : Container(height: 3),
          const SizedBox(height: 20),
          Illustrations.renderForgotPassword(context),
          const SizedBox(height: 20),
          MultiField(
            fields: MultiFields().listWithoutRoll,
            controller: widget.controller,
          ),
          const SizedBox(height: 10),
          LongFilledButton(
            label: "Send OTP",
            icon: Icons.send_rounded,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final String contact = widget.controller.text;
                Navigator.pop(context);
                context.go('/otp/$contact');
              }
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
