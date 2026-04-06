import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AlarmRepeat extends StatelessWidget {
  const AlarmRepeat({
    super.key,
    required this.selectedDays,
    required this.summaryText,
    required this.onDayToggle,
  });

  final List<bool> selectedDays;
  final String summaryText;
  final ValueChanged<int> onDayToggle;

  final List<String> dayLabels = const ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    final List<String> dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REPEAT',
                style: AppTextStyles.labelMedium(context).copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Expanded(
                child: Text(
                  summaryText,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.weekdayChipActive,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              dayLabels.length,
              (index) => GestureDetector(
                onTap: () => onDayToggle(index),
                child: Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedDays[index]
                        ? AppColors.weekdayChipActive
                        : AppColors.weekdayChipInactive,
                  ),
                  child: Text(
                    dayLabels[index],
                    style: selectedDays[index]
                        ? AppTextStyles.chipSelected(context)
                        : AppTextStyles.chipUnselected(context).copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
