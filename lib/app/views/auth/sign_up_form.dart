import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/data/apis/signup_api.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController rollController;
  final TextEditingController dateController;
  const SignUpForm({
    super.key,
    required this.rollController,
    required this.dateController,
  });
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            UniField(
              icon: Icons.account_circle,
              controller: widget.rollController,
              type: MultiFields.roll,
            ),
            SizedBox(
              height: 10.h,
            ),
            DatePickField(
              controller: widget.dateController,
            ),
            SizedBox(
              height: 20.h,
            ),
            LongFilledButton(
              label: "Let's Get Started",
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final scaffoldContext = ScaffoldMessenger.of(context);
                  IsLoading(true).dispatch(context);
                  String res = await getUser(
                    widget.rollController.text,
                    widget.dateController.text,
                  );
                  if (mounted) IsLoading(false).dispatch(context);
                  final SnackBar snackBar = SnackBar(
                    content: Text(res),
                    behavior: SnackBarBehavior.floating,
                  );
                  scaffoldContext.showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
