import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';
import 'package:material_symbols_icons/symbols.dart';

class BlendSlider extends StatefulWidget {
  final ThemeProvider value;
  final bool showColor;
  final bool showBorder;
  const BlendSlider({
    super.key,
    required this.value,
    this.showColor = true,
    this.showBorder = true,
  });

  @override
  State<BlendSlider> createState() => _BlendSliderState();
}

class _BlendSliderState extends State<BlendSlider> {
  late double lightBlendValue;
  late double darkBlendValue;

  @override
  void initState() {
    super.initState();
    lightBlendValue = widget.value.lightBlendLevel;
    darkBlendValue = widget.value.darkBlendLevel;
  }

  void onChangeLightBlendValue(double value) {
    setState(() {
      lightBlendValue = value;
    });
    widget.value.updateLightBlendLevel(value);
  }

  void onChangeDarkBlendValue(double value) {
    setState(() {
      darkBlendValue = value;
    });
    widget.value.updateDarkBlendLevel(value);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return renderSlider(
        Symbols.layers_rounded,
        isDark ? darkBlendValue : lightBlendValue,
        isDark ? onChangeDarkBlendValue : onChangeLightBlendValue);
  }

  Widget renderSlider(
      IconData icon, double blendValue, Function(double)? onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
        const Gap(20),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              value: blendValue,
              max: 40,
              divisions: 8,
              label: blendValue.round().toString(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
