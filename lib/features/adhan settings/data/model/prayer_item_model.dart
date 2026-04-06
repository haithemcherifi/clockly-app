class PrayerItemModel {
  final String name;
  final String time;
  final String iconName;
  final bool isEnabled;

  const PrayerItemModel({
    required this.name,
    required this.time,
    required this.iconName,
    required this.isEnabled,
  });

  PrayerItemModel copyWith({
    String? name,
    String? time,
    String? iconName,
    bool? isEnabled,
  }) {
    return PrayerItemModel(
      name: name ?? this.name,
      time: time ?? this.time,
      iconName: iconName ?? this.iconName,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
