import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/controllers.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

void showForgotSheet(BuildContext context) {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

  final TextEditingController controller = TextEditingController();
  showCustomModalBottomSheet(
    context,
    ForgotSheet(
      controller: controller,
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    bool isLoading = context.watch<ForgotProvider>().isLoading;
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
          const Gap(20),
          Illustrations.renderForgotPassword(context, isDark(context)),
          const Gap(20),
          MultiField(
            fields: MultiFields().listWithoutRoll,
            controller: widget.controller,
            updateCountryCode: updateCountryCode,
            updateIsPhoneLogin: updateIsPhoneLogin,
            enabled: !isLoading,
          ),
          const Gap(10),
          LongFilledButton(
            enabled: !isLoading,
            label: "Send OTP",
            icon: Icons.send_rounded,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                forgotController.checkUser(context);
              }
            },
          ),
          const Gap(50),
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
