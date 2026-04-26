import 'package:clockly_app/features/dashboard/views/widgets/clock_time.dart';
import 'package:clockly_app/features/dashboard/views/widgets/connect_and_location.dart';
import 'package:clockly_app/features/dashboard/views/widgets/next_alarm_and_prayer.dart';
import 'package:clockly_app/features/dashboard/views/widgets/quick_access.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // DashboredTop(),
              // SizedBox(height: 22),
              ConnectedAndLocation(),
              SizedBox(height: 30),
              ClockTime(),
              SizedBox(height: 22),
              NextAlarmAndPrayer(),
              SizedBox(height: 28),
              QuickAccess(),
            ],
          ),
        ),
      ],
    );
  }
}
