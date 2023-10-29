import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hitch_handler_v2/app/types/illustration_type.dart';
import 'package:hitch_handler_v2/app/views/utils/illustration_themer.dart';

class SvgAssetImage extends StatelessWidget {
  const SvgAssetImage({
    Key? key,
    required this.illustration,
    required this.color,
    this.alignment = Alignment.topCenter,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.errorWidget,
    this.padding,
    this.isDark = true,
    this.height,
    this.width,
  }) : super(key: key);
  final IllustrationType illustration;
  final Color color;
  final Alignment alignment;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? padding;
  final bool isDark;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadAndModifySvg(illustration, colorToHex(color), isDark),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: padding != null
                ? EdgeInsets.all(padding!)
                : const EdgeInsets.all(16),
            child: SvgPicture.string(
              snapshot.data!,
              height: height ?? illustration.height,
              width: width ?? illustration.width,
              alignment: alignment,
              fit: fit,
              semanticsLabel: illustration.semanticLabel,
            ),
          );
        } else if (snapshot.hasError) {
          return ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: height ?? illustration.height,
              width: width ?? illustration.width,
            ),
            child: Center(
              child: errorWidget ?? const Text('Could not load asset image!'),
            ),
          );
        } else {
          return ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: height ?? illustration.height,
              width: width ?? illustration.width,
            ),
            child: Center(
              child: placeholder ?? const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
