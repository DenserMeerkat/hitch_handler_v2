import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';
import 'package:hitch_handler_v2/app/views/widgets/post/elements/status_indicator.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';

class AdminStatusIndicator extends StatefulWidget {
  final StatusEnum statusEnum;
  const AdminStatusIndicator({
    super.key,
    required this.statusEnum,
  });

  @override
  State<AdminStatusIndicator> createState() => _AdminStatusIndicatorState();
}

class _AdminStatusIndicatorState extends State<AdminStatusIndicator> {
  @override
  Widget build(BuildContext context) {
    return MaterialClip(
      borderRadius: 50,
      child: PopupMenuButton(
        elevation: 1,
        surfaceTintColor:
            getStatusColor(context, widget.statusEnum).withOpacity(0.1),
        splashRadius: 25.0,
        offset: const Offset(0, 4),
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: StatusIndicator(
            stateEnum: widget.statusEnum,
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              height: 20,
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () {},
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              value: 0,
              child: const Text(
                "Update Status",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            PopupMenuItem<int>(
              padding: EdgeInsets.zero,
              height: 1,
              onTap: null,
              value: 1,
              child: Container(
                height: 1,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            PopupMenuItem<int>(
              height: 20,
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () {},
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              value: 2,
              child: const Text(
                "View Logs",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ];
        },
      ),
    );
  }
}
