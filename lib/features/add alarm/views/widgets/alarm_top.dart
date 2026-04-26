import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddAlarmTop extends StatelessWidget {
  const AddAlarmTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 28,
            color: AppColors.textSecondary,
          ),
        ),
        Spacer(),

        Text(
          'Add Alarm',
          style: AppTextStyles.cardTitle(context).copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.addAlarmTitle,
          ),
        ),
        Spacer(),

        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(null, size: 28, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
