import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/app/views/template/body_template.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:gap/gap.dart';

class ConfirmPassBody extends StatefulWidget {
  final String placeholder1;
  final String placeholder2;
  final String buttonLabel;
  final Function()? onPressed;
  const ConfirmPassBody({
    super.key,
    this.placeholder1 = "Password",
    this.placeholder2 = "Repeat Password",
    this.buttonLabel = "Confirm Password",
    this.onPressed,
  });
  @override
  State<ConfirmPassBody> createState() => _ConfirmPassBodyState();
}

class _ConfirmPassBodyState extends State<ConfirmPassBody> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      illustration: Illustrations.renderConfirmPass(context, isDark(context)),
      form: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              PasswordField(
                placeHolder: widget.placeholder1,
                controller: passController,
                validator: lengthValidator,
                showErrors: false,
              ),
              Gap(10.h),
              PasswordField(
                placeHolder: widget.placeholder2,
                controller: confPassController,
                validator: lengthValidator,
                showErrors: false,
              ),
              Gap(10.h),
              PasswordValidator(
                passController: passController,
                confPassController: confPassController,
              ),
              Gap(20.h),
              LongFilledButton(
                label: widget.buttonLabel,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    debugPrint("${widget.buttonLabel} Validated");
                    if (widget.onPressed != null) widget.onPressed!();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
