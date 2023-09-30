import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          renderSlider(Icons.light_mode_outlined, lightBlendValue,
              onChangeLightBlendValue, !isDark),
          renderSlider(Icons.dark_mode_outlined, darkBlendValue,
              onChangeDarkBlendValue, isDark),
        ],
      ),
    );
  }

  Row renderSlider(IconData icon, double blendValue,
      Function(double)? onChanged, bool enabled) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: enabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        ),
        Expanded(
          child: Slider(
            value: blendValue,
            max: 40,
            divisions: 8,
            label: blendValue.round().toString(),
            onChanged: enabled ? onChanged : null,
          ),
        ),
      ],
    );
  }
}
