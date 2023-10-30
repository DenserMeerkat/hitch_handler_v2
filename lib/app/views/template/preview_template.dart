import 'package:flutter/material.dart';

class PreviewTemplate extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget? footer;
  const PreviewTemplate({
    super.key,
    required this.header,
    required this.body,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      width: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor.withOpacity(0.3),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          header,
          Divider(
            height: 0.5,
            color: Theme.of(context).colorScheme.outlineVariant,
            thickness: 0.5,
          ),
          Container(
            height: footer != null ? 152 : 170,
            width: 108,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: footer == null
                  ? const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    )
                  : null,
            ),
            child: body,
          ),
          footer != null
              ? Divider(
                  height: 0.5,
                  color: Theme.of(context).colorScheme.outlineVariant,
                  thickness: 0.5,
                )
              : Container(),
          footer ?? Container(),
        ],
      ),
    );
  }
}
