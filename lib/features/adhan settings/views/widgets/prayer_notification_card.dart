import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PrayerNotificationCard extends StatelessWidget {
  const PrayerNotificationCard({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.prayerNotificationCard,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.prayerNotificationIconBg,
            ),
            child: const Icon(
              Icons.notifications,
              color: AppColors.prayerNotificationIcon,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prayer Notifications',
                  style: AppTextStyles.settingTitle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.settingTileTitle,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Enable Adhan for all\nprayers',
                  style: AppTextStyles.settingSubtitle(
                    context,
                  ).copyWith(color: AppColors.settingTileSubtitle, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Transform.scale(
            scale: 1.1,
            child: Switch(
              value: value,
              onChanged: onChanged,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.switchActive;
                }
                return AppColors.switchInactive;
              }),
              thumbColor: WidgetStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
