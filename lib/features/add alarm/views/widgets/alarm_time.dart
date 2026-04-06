import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AlarmTime extends StatelessWidget {
  const AlarmTime({
    super.key,
    required this.hour,
    required this.minute,
    required this.isAm,
    required this.onIncrementHour,
    required this.onDecrementHour,
    required this.onIncrementMinute,
    required this.onDecrementMinute,
    required this.onSelectAm,
    required this.onSelectPm,
  });

  final int hour;
  final int minute;
  final bool isAm;

  final VoidCallback onIncrementHour;
  final VoidCallback onDecrementHour;
  final VoidCallback onIncrementMinute;
  final VoidCallback onDecrementMinute;
  final VoidCallback onSelectAm;
  final VoidCallback onSelectPm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // HOUR
        Column(
          children: [
            IconButton(
              onPressed: onIncrementHour,
              icon: const Icon(
                Icons.keyboard_arrow_up,
                size: 35,
                color: AppColors.textMuted,
              ),
            ),
            Text(
              hour.toString().padLeft(2, '0'),
              style: AppTextStyles.textStyleBlack55(
                context,
              ).copyWith(color: AppColors.timePickerText),
            ),
            IconButton(
              onPressed: onDecrementHour,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 35,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),

        const SizedBox(width: 18),

        // COLON
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            ':',
            style: AppTextStyles.textStyleBlack55(
              context,
            ).copyWith(color: AppColors.textMuted),
          ),
        ),

        const SizedBox(width: 18),

        // MINUTE
        Column(
          children: [
            IconButton(
              onPressed: onIncrementMinute,
              icon: const Icon(
                Icons.keyboard_arrow_up,
                size: 37,
                color: AppColors.textMuted,
              ),
            ),
            Text(
              minute.toString().padLeft(2, '0'),
              style: AppTextStyles.textStyleBlack55(
                context,
              ).copyWith(color: AppColors.timePickerText),
            ),
            IconButton(
              onPressed: onDecrementMinute,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 35,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),

        const SizedBox(width: 24),

        // AM / PM
        Column(
          children: [
            GestureDetector(
              onTap: onSelectAm,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: isAm
                      ? AppColors.timePickerMeridiemBg
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'AM',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: isAm
                        ? AppColors.timePickerMeridiemText
                        : Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: onSelectPm,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: !isAm
                      ? AppColors.timePickerMeridiemBg
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'PM',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: !isAm
                        ? AppColors.timePickerMeridiemText
                        : Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
