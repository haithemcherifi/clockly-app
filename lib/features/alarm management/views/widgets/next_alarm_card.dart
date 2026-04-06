import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NextAlarmCard extends StatelessWidget {
  const NextAlarmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.nextAlarmCard,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.nextAlarmCard, Color(0xFF6BB5E8)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NEXT ALARM IN',
            style: AppTextStyles.labelMedium(
              context,
            ).copyWith(color: AppColors.nextAlarmLabel, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            '6h 42m',
            style: AppTextStyles.screenTitle(context).copyWith(
              fontSize: 37,
              fontWeight: FontWeight.w800,
              color: AppColors.nextAlarmValue,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.alarm,
                  size: 18,
                  color: AppColors.nextAlarmMeta,
                ),
                const SizedBox(width: 8),
                Text(
                  '07:00 AM • Weekdays',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: AppColors.nextAlarmMeta,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
