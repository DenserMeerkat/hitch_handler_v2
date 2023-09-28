import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

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
          create: (_) => ThemeProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: value.doneLoading
                    ? MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        title: appName,
                        theme: getTheme(value.selectedColorScheme, false,
                            value.lightBlendLevel, value.darkBlendLevel),
                        darkTheme: getTheme(value.selectedColorScheme, true,
                            value.lightBlendLevel, value.darkBlendLevel),
                        themeMode: value.selectedThemeMode,
                        routerConfig: router,
                      )
                    : LoadingScreen(
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

class LoadingScreen extends StatefulWidget {
  final BuildContext context;
  const LoadingScreen({
    super.key,
    required this.context,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (!mounted) return;
    widget.context.read<ThemeProvider>().doneLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                appName,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 120.w,
                ),
                child: const LProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
