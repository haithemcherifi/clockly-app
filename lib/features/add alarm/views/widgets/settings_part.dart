import 'package:clockly_app/features/add%20alarm/views/widgets/settings_switch_title.dart';
import 'package:clockly_app/features/add%20alarm/views/widgets/settings_title.dart';
import 'package:flutter/material.dart';

class SettingsPart extends StatelessWidget {
  const SettingsPart({
    super.key,
    required this.selectedTone,
    required this.alarmLabel,
    required this.isVibrateOn,
    required this.isSnoozeOn,
    required this.onToneTap,
    required this.onLabelTap,
    required this.onVibrateChanged,
    required this.onSnoozeChanged,
  });

  final String selectedTone;
  final String alarmLabel;
  final bool isVibrateOn;
  final bool isSnoozeOn;
  final VoidCallback onToneTap;
  final VoidCallback onLabelTap;
  final ValueChanged<bool> onVibrateChanged;
  final ValueChanged<bool> onSnoozeChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTile(
          icon: Icons.music_note,
          title: selectedTone,
          subtitle: 'Early Riser (Default)',
          onTap: onToneTap,
        ),
        const SizedBox(height: 5),
        SettingTile(
          icon: Icons.label,
          title: 'Label',
          subtitle: 'Morning Gym',
          onTap: onLabelTap,
        ),
        const SizedBox(height: 5),
        SettingSwitchTile(
          icon: Icons.vibration,
          title: 'Vibrate',
          subtitle: 'Always on',
          value: isVibrateOn,
          onChanged: onVibrateChanged,
        ),
        const SizedBox(height: 25),
        SettingSwitchTile(
          icon: Icons.snooze,
          title: 'Snooze',
          subtitle: '5 Minutes, 3 Times',
          value: isSnoozeOn,
          onChanged: onSnoozeChanged,
        ),
      ],
    );
  }
}
