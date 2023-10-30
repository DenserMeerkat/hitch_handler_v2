import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/blend_slider.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme_scroll.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatelessWidget {
  final Function(bool)? onDrawerToggle;
  const SliderPage({
    super.key,
    required GlobalKey<SliderDrawerState> sliderDrawerKey,
    this.onDrawerToggle,
  }) : _sliderDrawerKey = sliderDrawerKey;

  final GlobalKey<SliderDrawerState> _sliderDrawerKey;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    ThemeMode selectedThemeMode = themeProvider.selectedThemeMode;
    return GestureDetector(
      onHorizontalDragEnd: (dragDetail) {
        if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
          _sliderDrawerKey.currentState?.openSlider();
          onDrawerToggle?.call(true);
        } else {
          _sliderDrawerKey.currentState?.closeSlider();
          onDrawerToggle?.call(false);
        }
      },
      child: Container(
        alignment: Alignment.topCenter,
        width: 300.w,
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 280.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Scaffold(
            appBar: AppBar(
              primary: false,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
              actions: [
                IconButton(
                  tooltip: "Close",
                  onPressed: () {
                    _sliderDrawerKey.currentState!.closeSlider();
                    onDrawerToggle?.call(false);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 18,
                  ),
                ),
              ],
              bottom: bottomLine(context),
            ),
            body: SingleChildScrollView(
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
                  BlendSlider(
                    value: context.read<ThemeProvider>(),
                    showBorder: false,
                    showColor: false,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SegmentedButton<ThemeMode>(
                      style: OutlinedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity:
                            const VisualDensity(horizontal: -1, vertical: -1),
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
                          label: Text("System", style: TextStyle(fontSize: 12)),
                        ),
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.light,
                          icon: Icon(Icons.light_mode_outlined, size: 14),
                          label: Text("Light", style: TextStyle(fontSize: 12)),
                        ),
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.dark,
                          icon: Icon(Icons.dark_mode_outlined, size: 14),
                          label: Text("Dark", style: TextStyle(fontSize: 12)),
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
          ),
        ),
      ),
    );
  }
}
