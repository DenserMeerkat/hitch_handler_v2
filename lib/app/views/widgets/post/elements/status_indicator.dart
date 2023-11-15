import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';

class StatusIndicator extends StatelessWidget {
  final StatusEnum stateEnum;
  const StatusIndicator({
    super.key,
    required this.stateEnum,
  });

  @override
  Widget build(BuildContext context) {
    final StatusType statusType = getStatusType(stateEnum);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: getStatusColor(context, stateEnum).withOpacity(0.6),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: getStatusColor(context, stateEnum).withOpacity(0.4),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Icon(
              statusType.icon,
              size: 12,
            ),
            Container(
              width: 1,
              height: 18,
              margin: const EdgeInsets.only(left: 4, right: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            Text(
              statusType.title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
