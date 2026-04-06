import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ClockTime extends StatelessWidget {
  const ClockTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '06:45',
          style: AppTextStyles.clockTime(context).copyWith(
            fontSize: 80,
            fontWeight: FontWeight.w800,
            height: 1,
            color: AppColors.currentTimeText,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          'MONDAY, OCT 23',
          style: AppTextStyles.labelLarge(context).copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
            color: AppColors.currentDateText,
          ),
        ),
      ],
    );
  }
}
