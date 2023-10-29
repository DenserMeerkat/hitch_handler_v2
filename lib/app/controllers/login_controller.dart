import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/utils/notifiers.dart';
import 'package:hitch_handler_v2/data/apis/signin_api.dart';
import 'package:hitch_handler_v2/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginController {
  late LoginProvider _loginProvider;

  LoginController(BuildContext context) {
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }

  loginUser(BuildContext context) async {
    _loginProvider.updateIsLoading(true);
    final scaffoldContext = ScaffoldMessenger.of(context);
    final goContext = GoRouter.of(context);
    debugPrint("Sign In Validated");
    IsLoading(true).dispatch(context);
    final String username = context.read<LoginProvider>().isPhoneLogin
        ? "${context.read<LoginProvider>().countryCode} ${context.read<LoginProvider>().userName}"
        : context.read<LoginProvider>().userName;
    final String password = context.read<LoginProvider>().password;
    String result;
    if (!_loginProvider.isAdminLogin) {
      result = await loginStudent(
        username,
        password,
      );
    } else {
      result = await loginStudent(
        username,
        password,
      );
    }
    if (context.mounted) IsLoading(false).dispatch(context);
    if (result == "user found" && context.mounted) {
      goContext.go("/home");
    } else {
      final SnackBar snackBar = SnackBar(
        content: Text(result),
        behavior: SnackBarBehavior.floating,
      );
      scaffoldContext.showSnackBar(snackBar);
    }
    _loginProvider.updateIsLoading(false);
  }

  updateUsername(String userName) {
    if (_loginProvider.isPhoneLogin) {
      _loginProvider.updateUsername('${_loginProvider.countryCode} $userName');
    } else {
      _loginProvider.updateUsername(userName);
    }
  }

  updatePassword(String password) {
    _loginProvider.updatePassword(password);
  }

  updateCountryCode(String countryCode) {
    _loginProvider.updateCountryCode(countryCode);
  }

  updateIsPhoneLogin(bool isPhone) {
    _loginProvider.updateIsPhoneLogin(isPhone);
  }
}
