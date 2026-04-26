import 'dart:async';
import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/alarm%20management/manager/cubit/alarm_cubit.dart';
import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NextAlarmCard extends StatefulWidget {
  const NextAlarmCard({super.key});

  @override
  State<NextAlarmCard> createState() => _NextAlarmCardState();
}

class _NextAlarmCardState extends State<NextAlarmCard> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmCubit, List<AlarmModel>>(
      builder: (context, alarms) {
        final nextAlarm = _getNextUpcomingAlarm(alarms);

        if (nextAlarm == null) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.nextAlarmCard, Color(0xFF6BB5E8)],
              ),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEXT ALARM IN',
                  style: AppTextStyles.labelMedium(context).copyWith(
                    color: AppColors.nextAlarmLabel,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '--h --m',
                  style: AppTextStyles.screenTitle(context).copyWith(
                    fontSize: 37,
                    fontWeight: FontWeight.w800,
                    color: AppColors.nextAlarmValue,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'No active alarm',
                    style: AppTextStyles.bodyMedium(context).copyWith(
                      color: AppColors.nextAlarmMeta,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final nextDateTime = _getNextAlarmDateTime(nextAlarm);
        final remaining = nextDateTime.difference(DateTime.now());

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.nextAlarmCard, Color(0xFF6BB5E8)],
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NEXT ALARM IN',
                style: AppTextStyles.labelMedium(
                  context,
                ).copyWith(color: AppColors.nextAlarmLabel, letterSpacing: 1.5),
              ),
              const SizedBox(height: 8),
              Text(
                _formatRemainingTime(remaining),
                style: AppTextStyles.screenTitle(context).copyWith(
                  fontSize: 37,
                  fontWeight: FontWeight.w800,
                  color: AppColors.nextAlarmValue,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.alarm,
                      size: 18,
                      color: AppColors.nextAlarmMeta,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${nextAlarm.formattedTime} ${nextAlarm.period} • ${_formatAlarmDate(nextDateTime)}',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.nextAlarmMeta,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

DateTime _getNextAlarmDateTime(AlarmModel alarm) {
  final now = DateTime.now();

  int convertedHour = alarm.hour;

  if (alarm.isAm) {
    if (convertedHour == 12) {
      convertedHour = 0;
    }
  } else {
    if (convertedHour != 12) {
      convertedHour += 12;
    }
  }

  // If no days are selected, treat it like daily
  final hasSelectedDays = alarm.days.any((day) => day);

  for (int i = 0; i < 7; i++) {
    final candidateDate = now.add(Duration(days: i));

    // DateTime.weekday:
    // Monday = 1 ... Sunday = 7
    final dayIndex = candidateDate.weekday - 1;

    final isAllowedDay = hasSelectedDays ? alarm.days[dayIndex] : true;

    if (!isAllowedDay) continue;

    final candidateDateTime = DateTime(
      candidateDate.year,
      candidateDate.month,
      candidateDate.day,
      convertedHour,
      alarm.minute,
    );

    if (candidateDateTime.isAfter(now)) {
      return candidateDateTime;
    }
  }

  // fallback
  return now.add(const Duration(days: 1));
}

AlarmModel? _getNextUpcomingAlarm(List<AlarmModel> alarms) {
  final activeAlarms = alarms.where((alarm) => alarm.isActive).toList();

  if (activeAlarms.isEmpty) return null;

  activeAlarms.sort((a, b) {
    final aDate = _getNextAlarmDateTime(a);
    final bDate = _getNextAlarmDateTime(b);
    return aDate.compareTo(bDate);
  });

  return activeAlarms.first;
}

String _formatRemainingTime(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);

  return '${hours}h ${minutes}m';
}

String _formatAlarmDate(DateTime dateTime) {
  return DateFormat('EEE, MMM d').format(dateTime);
}
