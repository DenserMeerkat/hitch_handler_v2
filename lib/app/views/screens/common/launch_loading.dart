import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:provider/provider.dart';

class LaunchLoadingScreen extends StatefulWidget {
  final BuildContext context;
  const LaunchLoadingScreen({
    super.key,
    required this.context,
  });

  @override
  State<LaunchLoadingScreen> createState() => _LaunchLoadingScreenState();
}

class _LaunchLoadingScreenState extends State<LaunchLoadingScreen> {
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
      home: SystemOverlayWrapper(
        child: Scaffold(
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
      ),
    );
  }
}
