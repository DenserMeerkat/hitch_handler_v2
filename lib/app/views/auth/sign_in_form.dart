import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/controllers/controllers.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/auth/forgot_sheet.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/providers/login_provider.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  final TextEditingController textController;
  final TextEditingController passController;
  const SignInForm({
    super.key,
    required this.textController,
    required this.passController,
  });
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late LoginController loginController;
  late bool enabled;
  late bool isAdmin;
  @override
  void initState() {
    super.initState();
    loginController = LoginController(context);
    widget.textController.addListener(updateUsername);
    widget.passController.addListener(updatePassword);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    enabled = !Provider.of<LoginProvider>(context).isLoading;
    isAdmin = Provider.of<LoginProvider>(context, listen: true).isAdminLogin;
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MultiField(
              enabled: enabled,
              currentIndex: 0,
              fields:
                  isAdmin ? MultiFields().listWithoutRoll : MultiFields().list,
              controller: widget.textController,
              updateCountryCode: updateCountryCode,
              updateIsPhoneLogin: updateIsPhoneLogin,
            ),
            Gap(
              10.h,
            ),
            PasswordField(
              enabled: enabled,
              controller: widget.passController,
              validator: lengthValidator,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StudentAdminButton(
                  enabled: enabled,
                  updateIsAdminLogin: (value) {
                    debugPrint("isAdmin: $value");
                    widget.textController.clear();
                    widget.passController.clear();
                    loginController.reset();
                    loginController.updateIsAdminLogin(value);
                    setState(() {
                      isAdmin = value;
                    });
                  },
                ),
                UnderlineButton(
                  enabled: enabled,
                  onPressed: () {
                    showForgotSheet(context);
                  },
                  label: "Forgot Password?",
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ],
            ),
            Gap(
              6.h,
            ),
            LongFilledButton(
              enabled: enabled,
              label: "Log into Account",
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  loginController.loginUser(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateCountryCode(String countryCode) {
    loginController.updateCountryCode('+$countryCode');
  }

  void updateIsPhoneLogin(bool isPhone) {
    loginController.updateIsPhoneLogin(isPhone);
  }

  void updateUsername() {
    loginController.updateUsername(widget.textController.text);
  }

  void updatePassword() {
    loginController.updatePassword(widget.passController.text);
  }
}
