class AlarmModel {
  final int hour;
  final int minute;
  final bool isAm;
  final List<bool> days;
  final bool isSnoozeOn;
  final bool isVibrateOn;
  final String label;
  final String tone;
  final bool isActive;

  const AlarmModel({
    required this.hour,
    required this.minute,
    required this.isAm,
    required this.days,
    required this.isSnoozeOn,
    required this.isVibrateOn,
    required this.label,
    required this.tone,
    required this.isActive,
  });

  String get formattedTime {
    final formattedHour = hour.toString().padLeft(2, '0');
    final formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute';
  }

  String get period => isAm ? 'AM' : 'PM';

  int get totalMinutes {
    int convertedHour = hour;

    if (isAm) {
      if (convertedHour == 12) {
        convertedHour = 0;
      }
    } else {
      if (convertedHour != 12) {
        convertedHour += 12;
      }
    }

    return convertedHour * 60 + minute;
  }

  AlarmModel copyWith({
    int? hour,
    int? minute,
    bool? isAm,
    List<bool>? days,
    bool? isSnoozeOn,
    bool? isVibrateOn,
    String? label,
    String? tone,
    bool? isActive,
  }) {
    return AlarmModel(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      isAm: isAm ?? this.isAm,
      days: days ?? this.days,
      isSnoozeOn: isSnoozeOn ?? this.isSnoozeOn,
      isVibrateOn: isVibrateOn ?? this.isVibrateOn,
      label: label ?? this.label,
      tone: tone ?? this.tone,
      isActive: isActive ?? this.isActive,
    );
  }
}

List<AlarmModel> alarms = [
  const AlarmModel(
    hour: 07,
    minute: 30,
    label: 'Wake Up',
    isActive: true,
    days: [false, true, true, true, true, false, false],
    tone: '',
    isAm: true,
    isSnoozeOn: false,
    isVibrateOn: true,
  ),
  const AlarmModel(
    hour: 07,
    minute: 30,
    label: 'Wake Up',
    isActive: true,
    days: [false, true, true, true, true, false, false],
    tone: '',
    isAm: true,
    isSnoozeOn: false,
    isVibrateOn: true,
  ),

  const AlarmModel(
    hour: 05,
    minute: 59,
    label: 'Wake Up',
    isActive: true,
    days: [false, true, true, true, true, false, false],
    tone: '',
    isAm: true,
    isSnoozeOn: false,
    isVibrateOn: true,
  ),
];
