import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_form.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_scheme_button.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_segment.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
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
    children = {
      0: const ThemeSegment(
        iconData: Icons.smartphone_outlined,
        label: "System",
      ),
      1: const ThemeSegment(
        iconData: Icons.light_mode_outlined,
        label: "Light",
      ),
      2: const ThemeSegment(
        iconData: Icons.dark_mode_outlined,
        label: "Dark",
      ),
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Theme Settings",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: LeadingWidget(
          onPressed: () => context.pop(),
        ),
        bottom: bottomLine(context),
        toolbarHeight: kToolbarHeight,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 330.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).canvasColor.withOpacity(0.3),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      width: 1,
                    ),
                  ),
                  child: AbsorbPointer(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Transform.scale(
                        scale: 0.8,
                      ).transform,
                      child: SignInForm(
                        textController: controller,
                        passController: controller,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Consumer<ThemeProvider>(
                  builder: (builder, value, child) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: colorSchemes.entries.map((entry) {
                        final schemeName = entry.key;
                        final flexScheme = entry.value;

                        return ThemeSchemeButton(
                          key: ValueKey(schemeName),
                          flexScheme: flexScheme,
                          isActive: value.selectedColorScheme == flexScheme,
                          onPressed: () {
                            value.updateSelectedColorScheme(flexScheme);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => MaterialSegmentedControl(
                    children: children,
                    selectionIndex: getThemeIndex(
                        getThemeModeName(value.selectedThemeMode)),
                    borderColor: Theme.of(context).colorScheme.outlineVariant,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    unselectedColor: Theme.of(context).canvasColor,
                    borderWidth: 1.2,
                    borderRadius: 10.0,
                    horizontalPadding: EdgeInsets.zero,
                    onSegmentTapped: (index) {
                      value.updateSelectedThemeMode(
                          getThemeMode(getThemeFromIndex(index)));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
