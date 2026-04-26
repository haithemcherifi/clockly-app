import 'package:clockly_app/features/add%20alarm/views/add_alarm.dart';
import 'package:clockly_app/features/alarm%20management/views/widgets/alarm_card.dart';
import 'package:clockly_app/features/dashboard/data/alarm_model.dart';
import 'package:clockly_app/features/alarm%20management/manager/cubit/alarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmsPart extends StatelessWidget {
  const AlarmsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmCubit, List<AlarmModel>>(
      builder: (context, alarms) {
        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: alarms.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final alarm = alarms[index];

            return Dismissible(
              key: ValueKey(alarm.id ?? index),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                context.read<AlarmCubit>().removeAlarm(index);
              },
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddAlarm(alarm: alarm, alarmIndex: index),
                    ),
                  );
                },
                child: AlarmCard(
                  alarm: alarm,
                  onChanged: (value) {
                    context.read<AlarmCubit>().toggleAlarm(index, value);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
