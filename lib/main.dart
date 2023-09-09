import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:provider/provider.dart';

import 'package:hitch_handler_v2/routing/router.dart';
import 'package:hitch_handler_v2/theme/default.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late ThemeMode themeMode;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: FutureBuilder<String>(
            future: themeProvider.getThemeMode,
            builder: (context, snapshot) {
              themeMode = getThemeMode(snapshot.data ?? 'dark');
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                routerConfig: router,
              );
            },
          ),
        );
      },
    );
  }
}
