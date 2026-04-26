import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/adhan_settings_state.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/prayer_item_model.dart';
import 'package:clockly_app/features/adhan%20settings/manager/cubit/adhan_settings_cubit.dart';
import 'package:clockly_app/features/alarm%20management/manager/cubit/alarm_cubit.dart';
import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextAlarmAndPrayer extends StatelessWidget {
  const NextAlarmAndPrayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔔 NEXT ALARM
        BlocBuilder<AlarmCubit, List<AlarmModel>>(
          builder: (context, alarms) {
            final activeAlarms = alarms
                .where((alarm) => alarm.isActive)
                .toList();

            final nextAlarm = activeAlarms.isNotEmpty
                ? activeAlarms.first
                : null;

            return Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: AppColors.summaryCard,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    width: 53,
                    height: 53,
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
                      Row(
                        children: [
                          Text(
                            nextAlarm == null
                                ? 'No Alarm'
                                : '${nextAlarm.hour.toString().padLeft(2, '0')}:${nextAlarm.minute.toString().padLeft(2, '0')} ',
                            style: AppTextStyles.roboto20(
                              context,
                            ).copyWith(color: AppColors.summaryValue),
                          ),
                          if (nextAlarm != null)
                            Text(
                              nextAlarm.isAm ? 'AM' : 'PM',
                              style: AppTextStyles.roboto20(
                                context,
                              ).copyWith(color: AppColors.summaryValue),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 9),

        /// 🌙 NEXT PRAYER
        BlocBuilder<AdhanSettingsCubit, AdhanSettingsState>(
          builder: (context, state) {
            final nextPrayer = _getNextPrayer(state.prayers);

            return Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: AppColors.summaryCard,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    width: 53,
                    height: 53,
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
                      if (nextPrayer != null)
                        Text(
                          '${nextPrayer.name} - ${nextPrayer.time}',
                          style: AppTextStyles.roboto20(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.summaryValue,
                          ),
                        ),
                      if (nextPrayer == null)
                        Text(
                          'No next prayer',
                          style: AppTextStyles.roboto20(
                            context,
                          ).copyWith(color: AppColors.summaryValue),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////
/// 🔥 HELPERS (VERY IMPORTANT)
////////////////////////////////////////////////////////////

DateTime _getNextPrayerDateTime(String prayerTime) {
  final now = DateTime.now();

  /// 🔥 CLEAN STRING
  final clean = prayerTime.trim();

  /// handle both "04:15 PM" and "04:15PM"
  final regex = RegExp(r'(\d{1,2}):(\d{2})\s?(AM|PM)');
  final match = regex.firstMatch(clean);

  if (match == null) {
    throw Exception('Invalid prayer time format: $prayerTime');
  }

  int hour = int.parse(match.group(1)!);
  final minute = int.parse(match.group(2)!);
  final period = match.group(3)!;

  /// 🔥 convert to 24h
  if (period == 'AM') {
    if (hour == 12) hour = 0;
  } else {
    if (hour != 12) hour += 12;
  }

  DateTime prayerDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );

  if (!prayerDateTime.isAfter(now)) {
    prayerDateTime = prayerDateTime.add(const Duration(days: 1));
  }

  return prayerDateTime;
}

PrayerItemModel? _getNextPrayer(List<PrayerItemModel> prayers) {
  final enabledPrayers = prayers.where((prayer) => prayer.isEnabled).toList();

  if (enabledPrayers.isEmpty) return null;

  enabledPrayers.sort((a, b) {
    final aDate = _getNextPrayerDateTime(a.time);
    final bDate = _getNextPrayerDateTime(b.time);
    return aDate.compareTo(bDate);
  });

  return enabledPrayers.first;
}
