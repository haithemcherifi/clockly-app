import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ClockTime extends StatefulWidget {
  const ClockTime({super.key});

  @override
  State<ClockTime> createState() => _ClockTimeState();
}

class _ClockTimeState extends State<ClockTime> {
  late DateTime now;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    now = DateTime.now();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTime = DateFormat('hh:mm').format(now);
    final currentPeriod = DateFormat('a').format(now);
    final currentDate = DateFormat('EEEE, MMM d').format(now).toUpperCase();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentTime,
              style: AppTextStyles.clockTime(context).copyWith(
                fontSize: 75,
                fontWeight: FontWeight.w800,
                height: 1,
                color: AppColors.currentTimeText,
              ),
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                currentPeriod,
                style: AppTextStyles.bodyLarge(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.currentTimeText,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Text(
          currentDate,
          style: AppTextStyles.labelLarge(context).copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
            color: AppColors.currentDateText,
          ),
        ),
      ],
    );
  }
}
