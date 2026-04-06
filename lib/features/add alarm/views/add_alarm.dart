import 'package:clockly_app/core/utils/app_color.dart';

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
  const AddAlarm({super.key});

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
                          onLabelTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Label editing coming soon'),
                              ),
                            );
                          },
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
                              hour: hour,
                              minute: minute,
                              isAm: isAm,
                              days: List<bool>.from(selectedDays),
                              isSnoozeOn: isSnoozeOn,
                              isVibrateOn: isVibrateOn,
                              label: alarmLabel,
                              tone: selectedTone,
                              isActive: true,
                            );

                            context.read<AlarmCubit>().addAlarm(newAlarm);

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
