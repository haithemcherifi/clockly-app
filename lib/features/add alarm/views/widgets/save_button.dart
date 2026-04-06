import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.saveAlarmButton,
          foregroundColor: AppColors.saveAlarmButtonText,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'SAVE ALARM',
          style: AppTextStyles.buttonLarge(context).copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
            color: AppColors.saveAlarmButtonText,
          ),
        ),
      ),
    );
  }
}
