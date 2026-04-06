import 'package:clockly_app/features/adhan%20settings/data/model/prayer_item_model.dart';

class AdhanSettingsState {
  final bool prayerNotificationsEnabled;
  final String currentLocation;
  final String selectedAdhanSound;
  final double masterVolume;
  final List<PrayerItemModel> prayers;

  const AdhanSettingsState({
    required this.prayerNotificationsEnabled,
    required this.currentLocation,
    required this.selectedAdhanSound,
    required this.masterVolume,
    required this.prayers,
  });

  AdhanSettingsState copyWith({
    bool? prayerNotificationsEnabled,
    String? currentLocation,
    String? selectedAdhanSound,
    double? masterVolume,
    List<PrayerItemModel>? prayers,
  }) {
    return AdhanSettingsState(
      prayerNotificationsEnabled:
          prayerNotificationsEnabled ?? this.prayerNotificationsEnabled,
      currentLocation: currentLocation ?? this.currentLocation,
      selectedAdhanSound: selectedAdhanSound ?? this.selectedAdhanSound,
      masterVolume: masterVolume ?? this.masterVolume,
      prayers: prayers ?? this.prayers,
    );
  }
}
