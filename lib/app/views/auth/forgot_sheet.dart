import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/forgot_controller.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/long_filled_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/bottom_sheet.dart';
import 'package:hitch_handler_v2/app/types/illustrations.dart';
import 'package:hitch_handler_v2/providers/forgot_provider.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

void showForgotSheet(BuildContext context) {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

  final TextEditingController controller = TextEditingController();
  showCustomModalBottomSheet(
    context,
    ForgotSheet(
      controller: controller,
    ),
    backgroundColor: (isDark(context)
        ? Theme.of(context).appBarTheme.backgroundColor
        : Theme.of(context).highlightColor.mix(Colors.white, 80)),
  );
}

class ForgotSheet extends StatefulWidget {
  final TextEditingController controller;
  const ForgotSheet({super.key, required this.controller});

  @override
  State<ForgotSheet> createState() => _ForgotSheetState();
}

class _ForgotSheetState extends State<ForgotSheet> {
  final _formKey = GlobalKey<FormState>();
  late ForgotController forgotController;

  @override
  void initState() {
    super.initState();
    forgotController = ForgotController(context);
    widget.controller.addListener(() {
      forgotController.updateUsername(widget.controller.text);
    });
  }

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
          context.watch<ForgotProvider>().isLoading
              ? const LProgressIndicator()
              : Container(height: 3),
          const SizedBox(height: 20),
          Illustrations.renderForgotPassword(context, isDark(context)),
          const SizedBox(height: 20),
          MultiField(
            fields: MultiFields().listWithoutRoll,
            controller: widget.controller,
            updateCountryCode: updateCountryCode,
            updateIsPhoneLogin: updateIsPhoneLogin,
            enabled: !context.watch<ForgotProvider>().isLoading,
          ),
          const SizedBox(height: 10),
          LongFilledButton(
            enabled: !context.watch<ForgotProvider>().isLoading,
            label: "Send OTP",
            icon: Icons.send_rounded,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                forgotController.checkUser(context);
              }
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  void updateCountryCode(String countryCode) {
    forgotController.updateCountryCode('+$countryCode');
  }

  void updateIsPhoneLogin(bool isPhone) {
    forgotController.updateIsPhoneLogin(isPhone);
  }
}
