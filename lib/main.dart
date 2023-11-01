import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/app/views/screens/common/launch_loading.dart';

import 'package:hitch_handler_v2/routing/router.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    const MyApp(),
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
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Consumer2<ThemeProvider, UserProvider>(
            builder: (context, themeValue, userValue, child) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: themeValue.doneLoading
                    ? MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        title: appName,
                        theme: getTheme(
                            themeValue.selectedColorScheme,
                            false,
                            themeValue.lightBlendLevel,
                            themeValue.darkBlendLevel),
                        darkTheme: getTheme(
                            themeValue.selectedColorScheme,
                            true,
                            themeValue.lightBlendLevel,
                            themeValue.darkBlendLevel),
                        themeMode: themeValue.selectedThemeMode,
                        routerConfig: router,
                      )
                    : LaunchLoadingScreen(
                        context: context,
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
