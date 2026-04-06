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

  void togglePrayerNotifications(bool value) {
    emit(state.copyWith(prayerNotificationsEnabled: value));
  }

  void changeLocation(String location) {
    emit(state.copyWith(currentLocation: location));
  }

  void changeAdhanSound(String sound) {
    emit(state.copyWith(selectedAdhanSound: sound));
  }

  void changeMasterVolume(double volume) {
    emit(state.copyWith(masterVolume: volume));
  }

  void togglePrayer(int index, bool value) {
    final updatedPrayers = List<PrayerItemModel>.from(state.prayers);
    updatedPrayers[index] = updatedPrayers[index].copyWith(isEnabled: value);

    emit(state.copyWith(prayers: updatedPrayers));
  }
}
