import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

enum LoginType { student, admin }

class StudentAdminButton extends StatefulWidget {
  final bool enabled;
  final Function(bool) updateIsAdminLogin;
  const StudentAdminButton({
    super.key,
    this.enabled = true,
    required this.updateIsAdminLogin,
  });

  @override
  State<StudentAdminButton> createState() => _StudentAdminButtonState();
}

class _StudentAdminButtonState extends State<StudentAdminButton> {
  LoginType selectedLoginType = LoginType.student;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<LoginType>(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (widget.enabled && states.contains(MaterialState.selected)) {
            return Theme.of(context).colorScheme.tertiaryContainer;
          } else if (states.contains(MaterialState.selected)) {
            return Theme.of(context)
                .colorScheme
                .tertiaryContainer
                .withOpacity(0.4);
          } else {
            return Theme.of(context).colorScheme.onTertiary;
          }
        }),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -1, vertical: -3),
        side: MaterialStatePropertyAll<BorderSide>(
          BorderSide(
            color: isDark(context)
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).colorScheme.outlineVariant,
            width: 0.6,
          ),
        ),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      showSelectedIcon: false,
      segments: [
        ButtonSegment<LoginType>(
          enabled: widget.enabled,
          value: LoginType.student,
          label: const Text(
            "Student",
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ),
        ButtonSegment<LoginType>(
          enabled: widget.enabled,
          value: LoginType.admin,
          label: const Text(
            "Admin",
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
      selected: <LoginType>{selectedLoginType},
      onSelectionChanged: (Set<LoginType> newSelection) {
        bool isAdmin = newSelection.first == LoginType.admin;
        widget.updateIsAdminLogin.call(isAdmin);
        setState(() {
          selectedLoginType = newSelection.first;
        });
      },
    );
  }
}
