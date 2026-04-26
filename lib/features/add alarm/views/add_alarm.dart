import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';

import 'package:clockly_app/features/add%20alarm/views/widgets/alarm_repeat.dart';
import 'package:clockly_app/features/add%20alarm/views/widgets/alarm_time.dart';
import 'package:clockly_app/features/add%20alarm/views/widgets/alarm_top.dart';
import 'package:clockly_app/features/add%20alarm/views/widgets/save_button.dart';
import 'package:clockly_app/features/add%20alarm/views/widgets/settings_part.dart';
import 'package:clockly_app/features/alarm%20management/manager/cubit/alarm_cubit.dart';
import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key, this.alarm, this.alarmIndex});

  final AlarmModel? alarm;
  final int? alarmIndex;

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  int hour = 7;
  int minute = 30;
  bool isAm = true;

  List<bool> selectedDays = [true, true, true, false, false, false, false];

  final List<String> fullDayNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  bool isSnoozeOn = true;
  bool isVibrateOn = true;
  String selectedTone = 'Early Riser (Default)';
  String alarmLabel = 'Morning Gym';

  String label = 'Morning Gym';
  String tone = 'Early Riser (Default)';

  void toggleDay(int index) {
    setState(() {
      selectedDays[index] = !selectedDays[index];
    });
  }

  @override
  void initState() {
    super.initState();

    final alarm = widget.alarm;
    if (alarm != null) {
      hour = alarm.hour;
      minute = alarm.minute;
      isAm = alarm.isAm;
      selectedDays = List<bool>.from(alarm.days);
      isSnoozeOn = alarm.isSnoozeOn;
      isVibrateOn = alarm.isVibrateOn;
      alarmLabel = alarm.label;
      selectedTone = alarm.tone;
    }
  }

  Future<void> editAlarmLabel() async {
    final controller = TextEditingController(text: alarmLabel);

    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.settingTileIconBg,
                  ),
                  child: const Icon(
                    Icons.label_rounded,
                    color: AppColors.settingTileIcon,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Alarm Label',
                  style: AppTextStyles.cardTitle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Give your alarm a name',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium(
                    context,
                  ).copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller,
                  autofocus: true,
                  maxLength: 30,
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter label',
                    hintStyle: AppTextStyles.bodyMedium(
                      context,
                    ).copyWith(color: AppColors.textMuted),
                    filled: true,
                    fillColor: AppColors.softSurface,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(color: AppColors.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.bodyLarge(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, controller.text.trim());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: AppTextStyles.bodyLarge(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        alarmLabel = result.isEmpty ? 'Alarm' : result;
      });
    }
  }

  String getSelectedDaysText() {
    final selectedNames = <String>[];

    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i]) {
        selectedNames.add(fullDayNames[i]);
      }
    }

    if (selectedNames.isEmpty) {
      return 'None';
    }

    return selectedNames.join(', ');
  }

  void incrementHour() {
    setState(() {
      hour++;
      if (hour > 12) hour = 1;
    });
  }

  void decrementHour() {
    setState(() {
      hour--;
      if (hour < 1) hour = 12;
    });
  }

  void incrementMinute() {
    setState(() {
      minute++;
      if (minute > 59) minute = 0;
    });
  }

  void decrementMinute() {
    setState(() {
      minute--;
      if (minute < 0) minute = 59;
    });
  }

  void selectAm() {
    setState(() {
      isAm = true;
    });
  }

  void selectPm() {
    setState(() {
      isAm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          children: [
            AddAlarmTop(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        AlarmTime(
                          hour: hour,
                          minute: minute,
                          isAm: isAm,
                          onIncrementHour: incrementHour,
                          onDecrementHour: decrementHour,
                          onIncrementMinute: incrementMinute,
                          onDecrementMinute: decrementMinute,
                          onSelectAm: selectAm,
                          onSelectPm: selectPm,
                        ),
                        AlarmRepeat(
                          selectedDays: selectedDays,
                          summaryText: getSelectedDaysText(),
                          onDayToggle: toggleDay,
                        ),
                        SizedBox(height: 20),

                        SettingsPart(
                          selectedTone: selectedTone,
                          alarmLabel: alarmLabel,
                          isVibrateOn: isVibrateOn,
                          isSnoozeOn: isSnoozeOn,
                          onToneTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tone selection coming soon'),
                              ),
                            );
                          },
                          onLabelTap: editAlarmLabel,
                          onVibrateChanged: (value) {
                            setState(() {
                              isVibrateOn = value;
                            });
                          },
                          onSnoozeChanged: (value) {
                            setState(() {
                              isSnoozeOn = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        SaveButton(
                          onPressed: () {
                            final newAlarm = AlarmModel(
                              id: widget.alarm?.id,
                              hour: hour,
                              minute: minute,
                              isAm: isAm,
                              days: List<bool>.from(selectedDays),
                              isSnoozeOn: isSnoozeOn,
                              isVibrateOn: isVibrateOn,
                              label: alarmLabel,
                              tone: selectedTone,
                              isActive: widget.alarm?.isActive ?? true,
                            );

                            if (widget.alarm == null) {
                              context.read<AlarmCubit>().addAlarm(newAlarm);
                            } else {
                              context.read<AlarmCubit>().updateAlarm(
                                widget.alarmIndex!,
                                newAlarm,
                              );
                            }

                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// onPressed: () {
//   context.read<AlarmsCubit>().addAlarm(
//     hour: hour,
//     minute: minute,
//     isAm: isAm,
//   );

//   Navigator.pop(context);
// }
