import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/controllers/login_controller.dart';
import 'package:hitch_handler_v2/app/utils/input_validators.dart';
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
  @override
  void initState() {
    super.initState();
    loginController = LoginController(context);
    widget.textController.addListener(() {
      loginController.updateUsername(widget.textController.text);
    });
    widget.passController.addListener(() {
      loginController.updatePassword(widget.passController.text);
    });
  }

  final _formKey = GlobalKey<FormState>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MultiField(
              enabled: !context.watch<LoginProvider>().isLoading,
              controller: widget.textController,
              updateCountryCode: updateCountryCode,
              updateIsPhoneLogin: updateIsPhoneLogin,
            ),
            SizedBox(
              height: 10.h,
            ),
            PasswordField(
              enabled: !context.watch<LoginProvider>().isLoading,
              controller: widget.passController,
              validator: lengthValidator,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: UnderlineButton(
                onPressed: () {
                  showForgotSheet(context);
                },
                label: "Forgot Password?",
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            LongFilledButton(
              enabled: !context.watch<LoginProvider>().isLoading,
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
}
