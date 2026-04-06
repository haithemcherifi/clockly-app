import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({super.key, required this.alarm, required this.onChanged});

  final AlarmModel alarm;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.alarmCard,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    alarm.formattedTime,
                    style: AppTextStyles.alarmTime(context).copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: alarm.isActive
                          ? AppColors.alarmTimeActive
                          : const Color(0xFF9FA6AF),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      alarm.period,
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: alarm.isActive
                            ? AppColors.alarmLabel
                            : const Color(0xFFB0B7C0),
                      ),
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 1.15,
                child: Switch(
                  value: alarm.isActive,
                  onChanged: onChanged,
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                  trackColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color(0xFFA8E6A3);
                    }
                    return const Color(0xFFD9DDE2);
                  }),
                  thumbColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color(0xFF2F7D3D);
                    }
                    return const Color(0xFFB8BEC8);
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            alarm.label,
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: alarm.isActive
                  ? AppColors.alarmLabel
                  : const Color(0xFF7F8790),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DayChip(
                label: 'M',
                isSelected: alarm.days[0],
                isEnabled: alarm.isActive,
              ),
              DayChip(
                label: 'T',
                isSelected: alarm.days[1],
                isEnabled: alarm.isActive,
              ),
              DayChip(
                label: 'W',
                isSelected: alarm.days[2],
                isEnabled: alarm.isActive,
              ),
              DayChip(
                label: 'T',
                isSelected: alarm.days[3],
                isEnabled: alarm.isActive,
              ),
              DayChip(
                label: 'F',
                isSelected: alarm.days[4],
                isEnabled: alarm.isActive,
              ),
              DayChip(
                label: 'S',
                isSelected: alarm.days[5],
                isEnabled: alarm.isActive,
              ),
              DayChip(
                label: 'S',
                isSelected: alarm.days[6],
                isEnabled: alarm.isActive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DayChip extends StatelessWidget {
  const DayChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.isEnabled,
  });

  final String label;
  final bool isSelected;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    TextStyle textStyle;

    if (!isEnabled) {
      bgColor = const Color(0xFFE3E6EA);
      textStyle = AppTextStyles.chipUnselected(
        context,
      ).copyWith(color: const Color(0xFF4B525A), fontWeight: FontWeight.w600);
    } else if (isSelected) {
      bgColor = AppColors.weekdayChipActive;
      textStyle = AppTextStyles.chipSelected(context);
    } else {
      bgColor = AppColors.weekdayChipInactive;
      textStyle = AppTextStyles.chipUnselected(context);
    }

    return Container(
      width: 37,
      height: 37,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
      child: Text(label, style: textStyle),
    );
  }
}
