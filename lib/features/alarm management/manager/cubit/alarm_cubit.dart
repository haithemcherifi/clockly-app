import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmCubit extends Cubit<List<AlarmModel>> {
  AlarmCubit() : super(alarms);

  void addAlarm(AlarmModel alarm) {
    final updatedAlarms = List<AlarmModel>.from(state)..add(alarm);
    updatedAlarms.sort((a, b) => a.totalMinutes.compareTo(b.totalMinutes));
    emit(updatedAlarms);
  }

  void toggleAlarm(int index, bool value) {
    final updatedAlarms = List<AlarmModel>.from(state);
    updatedAlarms[index] = updatedAlarms[index].copyWith(isActive: value);
    emit(updatedAlarms);
  }
}
