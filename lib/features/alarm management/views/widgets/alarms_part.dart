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

            return AlarmCard(
              alarm: alarm,
              onChanged: (value) {
                context.read<AlarmCubit>().toggleAlarm(index, value);
              },
            );
          },
        );
      },
    );
  }
}
