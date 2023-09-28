import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/utils/input_validators.dart';
import 'package:hitch_handler_v2/app/utils/notifiers.dart';
import 'package:hitch_handler_v2/app/views/auth/forgot_sheet.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/long_filled_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/underline_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/password_field.dart';
import 'package:hitch_handler_v2/data/apis/signin_api.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MultiField(
              controller: widget.textController,
            ),
            SizedBox(
              height: 10.h,
            ),
            PasswordField(
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
              label: "Log into Account",
              onPressed: () async {
                if (mounted) context.go("/home");
                //if (_formKey.currentState!.validate()) {
                // final scaffoldContext = ScaffoldMessenger.of(context);
                // debugPrint("Sign In Validated");
                // IsLoading(true).dispatch(context);
                // String res = await loginUser1(
                //   widget.textController.text,
                //   widget.passController.text,
                // );
                // if (mounted) IsLoading(false).dispatch(context);

                // final SnackBar snackBar = SnackBar(
                //   content: Text(res),
                //   behavior: SnackBarBehavior.floating,
                // );
                // scaffoldContext.showSnackBar(snackBar);
                //}
              },
            ),
          ],
        ),
      ),
    );
  }
}
