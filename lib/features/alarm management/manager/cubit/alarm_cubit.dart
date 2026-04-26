import 'package:clockly_app/core/services/realtime_db_service.dart';
import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmCubit extends Cubit<List<AlarmModel>> {
  AlarmCubit() : super([]);

  final RealtimeDbService _dbService = RealtimeDbService();

  Future<void> loadAlarmsFromFirebase() async {
    final alarmsFromFirebase = await _dbService.loadAlarms();

    alarmsFromFirebase.sort((a, b) {
      final aDate = _getNextValidAlarmDateTime(a);
      final bDate = _getNextValidAlarmDateTime(b);
      return aDate.compareTo(bDate);
    });

    for (final alarm in alarmsFromFirebase) {
      print('Alarm id: ${alarm.id}, label: ${alarm.label}');
    }

    emit(alarmsFromFirebase);
  }

  Future<void> removeAlarm(int index) async {
    final updatedAlarms = List<AlarmModel>.from(state);
    final alarmToRemove = updatedAlarms[index];

    updatedAlarms.removeAt(index);
    emit(updatedAlarms);

    if (alarmToRemove.id != null) {
      await _dbService.deleteAlarm(alarmToRemove.id!);
    }
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    final updatedAlarms = List<AlarmModel>.from(state)..add(alarm);

    updatedAlarms.sort((a, b) {
      final aDate = _getNextValidAlarmDateTime(a);
      final bDate = _getNextValidAlarmDateTime(b);
      return aDate.compareTo(bDate);
    });

    emit(updatedAlarms);

    await _dbService.addAlarm(alarm.toMap());
  }

  Future<void> toggleAlarm(int index, bool value) async {
    final updatedAlarms = List<AlarmModel>.from(state);

    final updatedAlarm = updatedAlarms[index].copyWith(isActive: value);
    updatedAlarms[index] = updatedAlarm;

    updatedAlarms.sort((a, b) {
      final aDate = _getNextValidAlarmDateTime(a);
      final bDate = _getNextValidAlarmDateTime(b);
      return aDate.compareTo(bDate);
    });

    emit(updatedAlarms);

    if (updatedAlarm.id != null) {
      await _dbService.updateAlarm(updatedAlarm.id!, updatedAlarm.toMap());
    }
  }

  Future<void> updateAlarm(int index, AlarmModel updatedAlarm) async {
    final updatedAlarms = List<AlarmModel>.from(state);
    updatedAlarms[index] = updatedAlarm;

    updatedAlarms.sort((a, b) {
      final aDate = _getNextValidAlarmDateTime(a);
      final bDate = _getNextValidAlarmDateTime(b);
      return aDate.compareTo(bDate);
    });

    emit(updatedAlarms);

    if (updatedAlarm.id != null) {
      await _dbService.updateAlarm(updatedAlarm.id!, updatedAlarm.toMap());
    }
  }
}

DateTime _getNextValidAlarmDateTime(AlarmModel alarm) {
  final now = DateTime.now();

  int convertedHour = alarm.hour;

  if (alarm.isAm) {
    if (convertedHour == 12) {
      convertedHour = 0;
    }
  } else {
    if (convertedHour != 12) {
      convertedHour += 12;
    }
  }

  final hasSelectedDays = alarm.days.any((day) => day);

  for (int i = 0; i < 7; i++) {
    final candidateDate = now.add(Duration(days: i));

    // Monday = 1 ... Sunday = 7
    final dayIndex = candidateDate.weekday - 1;

    final isAllowedDay = hasSelectedDays ? alarm.days[dayIndex] : true;

    if (!isAllowedDay) continue;

    final candidateDateTime = DateTime(
      candidateDate.year,
      candidateDate.month,
      candidateDate.day,
      convertedHour,
      alarm.minute,
    );

    if (candidateDateTime.isAfter(now)) {
      return candidateDateTime;
    }
  }

  return now.add(const Duration(days: 7));
}
