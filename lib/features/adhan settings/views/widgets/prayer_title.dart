import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/prayer_item_model.dart';
import 'package:flutter/material.dart';

class PrayerTile extends StatelessWidget {
  const PrayerTile({super.key, required this.prayer, required this.onChanged});

  final PrayerItemModel prayer;
  final ValueChanged<bool> onChanged;

  IconData _getPrayerIcon(String iconName) {
    switch (iconName) {
      case 'fajr':
        return Icons.wb_twilight;
      case 'dhuhr':
        return Icons.wb_sunny;
      case 'asr':
        return Icons.brightness_5;
      case 'maghrib':
        return Icons.wb_twilight_outlined;
      case 'isha':
        return Icons.nights_stay;
      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color iconBackgroundColor;
    Color iconColor;

    switch (prayer.name) {
      case 'Dhuhr':
        iconBackgroundColor = prayer.isEnabled
            ? const Color(0xFFE7F6E7)
            : AppColors.softSurface;
        iconColor = prayer.isEnabled
            ? const Color(0xFF2F7D3D)
            : AppColors.iconSecondary;
        break;

      case 'Asr':
        iconBackgroundColor = prayer.isEnabled
            ? const Color(0xFFEAF5FF)
            : AppColors.softSurface;
        iconColor = prayer.isEnabled
            ? AppColors.primary
            : AppColors.iconSecondary;
        break;

      default:
        iconBackgroundColor = AppColors.softSurface;
        iconColor = AppColors.iconSecondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.prayerItemBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBackgroundColor,
            ),
            child: Icon(
              _getPrayerIcon(prayer.iconName),
              color: iconColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prayer.name,
                  style: AppTextStyles.settingTitle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: prayer.isEnabled
                        ? AppColors.prayerName
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  prayer.time,
                  style: AppTextStyles.settingSubtitle(context).copyWith(
                    color: prayer.isEnabled
                        ? AppColors.prayerTime
                        : AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.volume_up,
            size: 18,
            color: prayer.isEnabled
                ? AppColors.iconSecondary
                : AppColors.textMuted,
          ),
          const SizedBox(width: 10),
          Transform.scale(
            scale: 1.05,
            child: Switch(
              value: prayer.isEnabled,
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
