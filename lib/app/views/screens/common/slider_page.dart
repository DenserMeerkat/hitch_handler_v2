import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:inner_drawer/inner_drawer.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme_widgets.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';

class SliderPage extends StatelessWidget {
  final GlobalKey<InnerDrawerState> innerDrawerKey;
  const SliderPage({
    super.key,
    required this.innerDrawerKey,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    ThemeMode selectedThemeMode = themeProvider.selectedThemeMode;
    bool isAmoled = themeProvider.trueDark;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: isAmoled || selectedThemeMode == ThemeMode.light
          ? Theme.of(context).colorScheme.surfaceVariant
          : Theme.of(context).colorScheme.onInverseSurface,
      child: Drawer(
        width: 300.w,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  color: Theme.of(context).colorScheme.surface,
                  child: Row(
                    children: [
                      const Gap(16),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: "Close",
                        onPressed: () {
                          innerDrawerKey.currentState!.close();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                        ),
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Theme.of(context).dividerColor,
                ),
                const Gap(8),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: ColorSchemeScroll(
                          value: context.read<ThemeProvider>(),
                          size: 40,
                          padding: 8,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: BlendSlider(
                          value: context.read<ThemeProvider>(),
                          showBorder: false,
                          showColor: false,
                        ),
                      ),
                      const Gap(8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const AmoledSwitch(),
                      ),
                      const Gap(8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SegmentedButton<ThemeMode>(
                          style: OutlinedButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                                horizontal: -1, vertical: -1),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            side: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 0.6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          showSelectedIcon: false,
                          segments: const [
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.system,
                              icon: Icon(Icons.smartphone_outlined, size: 14),
                              label: Text("System",
                                  style: TextStyle(fontSize: 12)),
                            ),
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.light,
                              icon: Icon(Icons.light_mode_outlined, size: 14),
                              label:
                                  Text("Light", style: TextStyle(fontSize: 12)),
                            ),
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.dark,
                              icon: Icon(Icons.dark_mode_outlined, size: 14),
                              label:
                                  Text("Dark", style: TextStyle(fontSize: 12)),
                            ),
                          ],
                          selected: <ThemeMode>{selectedThemeMode},
                          onSelectionChanged: (Set<ThemeMode> newSelection) {
                            themeProvider
                                .updateSelectedThemeMode(newSelection.first);
                          },
                        ),
                      ),
                    ],
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
