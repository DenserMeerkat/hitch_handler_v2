import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      padding: EdgeInsets.only(left: widget.showBorder ? 16.w : 24.w),
      constraints: BoxConstraints(
        maxWidth: 330.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.showColor ? Theme.of(context).colorScheme.surface : null,
        border: widget.showBorder
            ? Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outlineVariant
                    .withOpacity(0.4),
                width: 1,
              )
            : null,
      ),
      child: renderSlider(
          Symbols.layers_rounded,
          isDark ? darkBlendValue : lightBlendValue,
          isDark ? onChangeDarkBlendValue : onChangeLightBlendValue),
    );
  }

  Row renderSlider(
      IconData icon, double blendValue, Function(double)? onChanged) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
        Expanded(
          child: Slider(
            value: blendValue,
            max: 40,
            divisions: 8,
            label: blendValue.round().toString(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
