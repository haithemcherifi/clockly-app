import 'package:clockly_app/features/alarm%20management/views/widgets/add_alarm.dart';
import 'package:clockly_app/features/alarm%20management/views/widgets/alarms_part.dart';
import 'package:clockly_app/features/alarm%20management/views/widgets/next_alarm_card.dart';
import 'package:flutter/material.dart';
import 'package:clockly_app/core/services/realtime_db_service.dart';

class AlarmManagementView extends StatelessWidget {
  const AlarmManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              NextAlarmCard(),
              SizedBox(height: 20),
              AlarmsPart(),
              SizedBox(height: 20),
              AddAlarmButton(),
            ],
          ),
        ),
      ],
    );
  }
}
