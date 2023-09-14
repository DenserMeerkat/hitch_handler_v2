import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';

import 'package:hitch_handler_v2/routing/router.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 5000),
            child: AdaptiveTheme(
                light: ThemeProvider.lightTheme,
                dark: ThemeProvider.darkTheme,
                initial: savedThemeMode ?? AdaptiveThemeMode.dark,
                builder: (lightTheme, darkTheme) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: appName,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    routerConfig: router,
                  );
                }),
          ),
        );
      },
    );
  }
}
