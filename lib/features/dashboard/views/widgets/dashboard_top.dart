import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DashboredTop extends StatelessWidget {
  const DashboredTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.09,
          height: MediaQuery.of(context).size.width * 0.09,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.access_time_filled,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Clockly',
          style: AppTextStyles.cardTitle(context).copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.dashboardHeaderTitle,
          ),
        ),
        const Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.09,
          height: MediaQuery.of(context).size.width * 0.09,
          decoration: const BoxDecoration(
            color: Color(0xFFEAF1F5),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Icon(Icons.person, size: 22, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
