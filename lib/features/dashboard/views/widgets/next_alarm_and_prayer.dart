import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NextAlarmAndPrayer extends StatelessWidget {
  const NextAlarmAndPrayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.summaryCard,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.summaryIconBg,
                ),
                child: const Icon(
                  Icons.alarm,
                  color: AppColors.summaryIcon,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEXT ALARM',
                    style: AppTextStyles.labelMedium(context).copyWith(
                      letterSpacing: 1.5,
                      color: AppColors.summaryLabel,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '07:00 AM',
                    style: AppTextStyles.cardTitle(context).copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.summaryValue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 9),
        // second card
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.summaryCard,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE7F6E7),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Color(0xFF2F7D3D),
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEXT PRAYER',
                    style: AppTextStyles.labelMedium(context).copyWith(
                      letterSpacing: 1.5,
                      color: AppColors.summaryLabel,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Fajr - 05:20 AM',
                    style: AppTextStyles.cardTitle(context).copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.summaryValue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
