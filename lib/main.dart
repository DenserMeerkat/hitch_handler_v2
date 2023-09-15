import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/color_provider.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

import 'package:hitch_handler_v2/routing/router.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Consumer<ThemeProvider>(builder: (context, value, child) {
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: appName,
                theme: getTheme(value.selectedColorScheme, false),
                darkTheme: getTheme(value.selectedColorScheme, true),
                themeMode: value.selectedThemeMode,
                routerConfig: router,
              ),
            );
          });
        },
      ),
    );
  }
}
