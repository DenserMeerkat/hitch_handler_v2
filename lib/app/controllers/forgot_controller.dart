import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/utils/notifiers.dart';
import 'package:hitch_handler_v2/providers/forgot_provider.dart';
import 'package:provider/provider.dart';

class ForgotController {
  late ForgotProvider _forgotProvider;

  ForgotController(BuildContext context) {
    _forgotProvider = Provider.of<ForgotProvider>(context, listen: false);
  }

  checkUser(BuildContext context) async {
    _forgotProvider.updateIsLoading(true);
    final goContext = GoRouter.of(context);
    IsLoading(true).dispatch(context);
    final String username = context.read<ForgotProvider>().isPhoneLogin
        ? "${context.read<ForgotProvider>().countryCode} ${context.read<ForgotProvider>().userName}"
        : context.read<ForgotProvider>().userName;
    String result;
    if (!_forgotProvider.isAdminLogin) {
      result = await Future.delayed(
          const Duration(milliseconds: 1500), () => "OTP sent");
    } else {
      result = await Future.delayed(
          const Duration(milliseconds: 1500), () => "OTP sent");
    }
    _forgotProvider.updateIsLoading(false);
    if (context.mounted) IsLoading(false).dispatch(context);
    if (result == "OTP sent" && context.mounted) {
      Navigator.pop(context);
      goContext.go('/otp/$username');
    }
  }

  updateUsername(String userName) {
    if (_forgotProvider.isPhoneLogin) {
      _forgotProvider
          .updateUsername('${_forgotProvider.countryCode} $userName');
    } else {
      _forgotProvider.updateUsername(userName);
    }
  }

  updateCountryCode(String countryCode) {
    _forgotProvider.updateCountryCode(countryCode);
  }

  updateIsPhoneLogin(bool isPhone) {
    _forgotProvider.updateIsPhoneLogin(isPhone);
  }
}
