import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/blend_slider.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme_scroll.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_mode/theme_mode_switch.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_preview/theme_preview.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/appbar_icon_button.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Map<int, Widget> children;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      showTitle: false,
      toolbarHeight: 16.h,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: AppbarIconButton(
              onPressed: () => context.pop(),
            ),
          ),
          bottom: bottomLine(context),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30.h),
            const ThemePreview(),
            SizedBox(height: 35.h),
            ColorSchemeScroll(
              value: context.read<ThemeProvider>(),
            ),
            SizedBox(height: 20.h),
            BlendSlider(
              value: context.read<ThemeProvider>(),
            ),
            SizedBox(height: 30.h),
            ThemeModeSwitch(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
