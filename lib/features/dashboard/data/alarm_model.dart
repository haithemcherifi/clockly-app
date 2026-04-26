class AlarmModel {
  final String? id;
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
    this.id,
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

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'minute': minute,
      'isAm': isAm,
      'days': days,
      'isSnoozeOn': isSnoozeOn,
      'isVibrateOn': isVibrateOn,
      'label': label,
      'tone': tone,
      'isActive': isActive,
    };
  }

  factory AlarmModel.fromMap(Map<dynamic, dynamic> map, {String? id}) {
    return AlarmModel(
      id: id,
      hour: map['hour'] ?? 0,
      minute: map['minute'] ?? 0,
      isAm: map['isAm'] ?? true,
      days: List<bool>.from(map['days'] ?? []),
      isSnoozeOn: map['isSnoozeOn'] ?? false,
      isVibrateOn: map['isVibrateOn'] ?? false,
      label: map['label'] ?? 'Alarm',
      tone: map['tone'] ?? 'Default',
      isActive: map['isActive'] ?? true,
    );
  }

  AlarmModel copyWith({
    String? id,
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
      id: id ?? this.id,
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
