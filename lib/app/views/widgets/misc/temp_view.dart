import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempView extends StatelessWidget {
  final String emptyText;
  const TempView({
    super.key,
    required this.emptyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Text(
          emptyText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            fontSize: 16.sp,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
