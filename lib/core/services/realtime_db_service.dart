import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDbService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference get settingsRef => _database.ref('clockly/settings');
  DatabaseReference get alarmsRef => _database.ref('clockly/alarms');
  DatabaseReference get cachedPrayerTimesRef =>
      _database.ref('clockly/cached_prayer_times');
  DatabaseReference get deviceRef => _database.ref('clockly/device');

  Future<void> saveAdhanSettings({
    required bool prayerNotificationsEnabled,
    required String selectedAdhanSound,
    required double masterVolume,
    required Map<String, bool> prayersEnabled,
  }) async {
    await settingsRef.update({
      'prayerNotificationsEnabled': prayerNotificationsEnabled,
      'selectedAdhanSound': selectedAdhanSound,
      'masterVolume': masterVolume,
      'prayersEnabled': prayersEnabled,
    });
  }

  Future<Map<dynamic, dynamic>?> loadAdhanSettings() async {
    final snapshot = await settingsRef.get();

    if (snapshot.exists) {
      return snapshot.value as Map<dynamic, dynamic>;
    }

    return null;
  }

  Future<void> addAlarm(Map<String, dynamic> alarmMap) async {
    await alarmsRef.push().set(alarmMap);
  }

  Future<List<AlarmModel>> loadAlarms() async {
    final snapshot = await alarmsRef.get();

    if (!snapshot.exists || snapshot.value == null) {
      return [];
    }

    final rawData = snapshot.value;

    if (rawData is! Map) {
      return [];
    }

    final data = Map<dynamic, dynamic>.from(rawData);

    final alarmsList = data.entries.map((entry) {
      final alarmId = entry.key.toString();
      final alarmData = Map<dynamic, dynamic>.from(entry.value);

      return AlarmModel.fromMap(alarmData, id: alarmId);
    }).toList();

    return alarmsList;
  }

  Future<void> updateAlarm(String id, Map<String, dynamic> alarmMap) async {
    await alarmsRef.child(id).update(alarmMap);
  }

  Future<void> deleteAlarm(String id) async {
    await alarmsRef.child(id).remove();
  }
}
