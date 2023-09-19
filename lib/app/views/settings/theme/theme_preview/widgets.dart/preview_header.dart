import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

class PreviewHeader extends StatelessWidget {
  final BuildContext context;
  final String title;
  final IconData icon;
  final bool isDarkMode;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const PreviewHeader({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
    this.isDarkMode = true,
    this.leadingIcon = Icons.arrow_back_rounded,
    this.trailingIcon = Icons.settings_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 15,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                appName.toUpperCase(),
                style: TextStyle(
                  fontSize: 2,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
          Container(
            height: 19,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  offset: const Offset(0, -1),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    leadingIcon,
                    size: 6,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2.2),
                    decoration: BoxDecoration(
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.onTertiary
                            : Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0.4),
                            color: isDarkMode ? kBlack10 : kLGrey30,
                          )
                        ]),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          size: 4,
                          color: isDarkMode
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          title,
                          style: TextStyle(
                            color: isDarkMode
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                            fontSize: 3.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    trailingIcon,
                    size: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
