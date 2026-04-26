import 'package:clockly_app/core/services/prayer_times_service.dart';
import 'package:clockly_app/core/services/realtime_db_service.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/adhan_settings_state.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/prayer_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdhanSettingsCubit extends Cubit<AdhanSettingsState> {
  AdhanSettingsCubit()
    : super(
        AdhanSettingsState(
          prayerNotificationsEnabled: true,
          currentLocation: 'Istanbul, Turkey',
          selectedAdhanSound: 'Makkah (Al-Haram)',
          masterVolume: 85,
          prayers: const [
            PrayerItemModel(
              name: 'Fajr',
              time: '05:12 AM',
              iconName: 'fajr',
              isEnabled: true,
            ),
            PrayerItemModel(
              name: 'Dhuhr',
              time: '12:45 PM',
              iconName: 'dhuhr',
              isEnabled: true,
            ),
            PrayerItemModel(
              name: 'Asr',
              time: '04:22 PM',
              iconName: 'asr',
              isEnabled: true,
            ),
            PrayerItemModel(
              name: 'Maghrib',
              time: '07:14 PM',
              iconName: 'maghrib',
              isEnabled: true,
            ),
            PrayerItemModel(
              name: 'Isha',
              time: '08:45 PM',
              iconName: 'isha',
              isEnabled: true,
            ),
          ],
        ),
      );

  final RealtimeDbService _dbService = RealtimeDbService();

  Future<void> _saveSettingsToFirebase() async {
    final prayersEnabled = {
      'fajr': state.prayers.firstWhere((p) => p.name == 'Fajr').isEnabled,
      'dhuhr': state.prayers.firstWhere((p) => p.name == 'Dhuhr').isEnabled,
      'asr': state.prayers.firstWhere((p) => p.name == 'Asr').isEnabled,
      'maghrib': state.prayers.firstWhere((p) => p.name == 'Maghrib').isEnabled,
      'isha': state.prayers.firstWhere((p) => p.name == 'Isha').isEnabled,
    };

    await _dbService.saveAdhanSettings(
      prayerNotificationsEnabled: state.prayerNotificationsEnabled,
      selectedAdhanSound: state.selectedAdhanSound,
      masterVolume: state.masterVolume,
      prayersEnabled: prayersEnabled,
    );
  }

  final PrayerTimesService _prayerTimesService = PrayerTimesService();

  Future<void> loadPrayerTimes({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final prayerTimes = await _prayerTimesService.fetchPrayerTimes(
        latitude: latitude,
        longitude: longitude,
      );

      final updatedPrayers = state.prayers.map((prayer) {
        switch (prayer.name) {
          case 'Fajr':
            return prayer.copyWith(time: prayerTimes.fajr);
          case 'Dhuhr':
            return prayer.copyWith(time: prayerTimes.dhuhr);
          case 'Asr':
            return prayer.copyWith(time: prayerTimes.asr);
          case 'Maghrib':
            return prayer.copyWith(time: prayerTimes.maghrib);
          case 'Isha':
            return prayer.copyWith(time: prayerTimes.isha);
          default:
            return prayer;
        }
      }).toList();

      emit(state.copyWith(prayers: updatedPrayers));
    } catch (e) {
      print('Prayer times error: $e');
    }
  }

  Future<void> togglePrayerNotifications(bool value) async {
    emit(state.copyWith(prayerNotificationsEnabled: value));
    await _saveSettingsToFirebase();
  }

  void changeLocation(String location) {
    emit(state.copyWith(currentLocation: location));
  }

  Future<void> changeAdhanSound(String sound) async {
    emit(state.copyWith(selectedAdhanSound: sound));
    await _saveSettingsToFirebase();
  }

  Future<void> changeMasterVolume(double volume) async {
    emit(state.copyWith(masterVolume: volume));
    await _saveSettingsToFirebase();
  }

  Future<void> togglePrayer(int index, bool value) async {
    final updatedPrayers = List<PrayerItemModel>.from(state.prayers);
    updatedPrayers[index] = updatedPrayers[index].copyWith(isEnabled: value);

    emit(state.copyWith(prayers: updatedPrayers));
    await _saveSettingsToFirebase();
  }

  Future<void> loadSettingsFromFirebase() async {
    final data = await _dbService.loadAdhanSettings();

    if (data == null) return;

    final prayersEnabled = data['prayersEnabled'] ?? {};

    final updatedPrayers = state.prayers.map((prayer) {
      final isEnabled = prayersEnabled[prayer.name.toLowerCase()] ?? true;

      return prayer.copyWith(isEnabled: isEnabled);
    }).toList();

    emit(
      state.copyWith(
        prayerNotificationsEnabled: data['prayerNotificationsEnabled'] ?? true,
        selectedAdhanSound: data['selectedAdhanSound'] ?? 'Makkah (Al-Haram)',
        masterVolume: (data['masterVolume'] ?? 85).toDouble(),
        prayers: updatedPrayers,
      ),
    );
  }
}
