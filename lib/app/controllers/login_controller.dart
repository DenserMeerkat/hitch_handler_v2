import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';
import 'package:hitch_handler_v2/data/apis/signin_api.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
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
    IsLoading(true).dispatch(context);
    final String username = context.read<LoginProvider>().userName;
    final String password = context.read<LoginProvider>().password;
    UserResponseModel result;
    if (_loginProvider.isAdminLogin) {
      result = await loginAdmin(
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
    _loginProvider.updateIsLoading(false);
    if (result.statusCode == 200) {
      if (context.mounted) {
        debugPrint("token : ${result.token}");
        context
            .read<UserProvider>()
            .saveToStorage(result.token, result.userData);
      }
      if (!_loginProvider.isAdminLogin) {
        scaffoldContext.hideCurrentMaterialBanner();
        scaffoldContext.hideCurrentSnackBar();
        goContext.go("/home");
      } else {
        scaffoldContext.hideCurrentMaterialBanner();
        scaffoldContext.hideCurrentSnackBar();
        goContext.go("/home");
      }
    } else {
      if (context.mounted) {
        final MaterialBanner materialBanner = showCustomMaterialBanner(
          context,
          contentText: result.message,
        );
        scaffoldContext.hideCurrentMaterialBanner();
        scaffoldContext.showMaterialBanner(materialBanner);
      }
    }
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

  updateIsAdminLogin(bool isAdmin) {
    _loginProvider.updateIsAdminLogin(isAdmin);
  }

  reset() {
    _loginProvider.reset();
  }
}
