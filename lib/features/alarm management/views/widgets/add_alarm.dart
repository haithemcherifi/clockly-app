import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/add%20alarm/views/add_alarm.dart';
import 'package:flutter/material.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => AddAlarm()));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.addAlarmButton,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.white, size: 22),
            const SizedBox(width: 10),
            Text(
              'ADD NEW ALARM',
              style: AppTextStyles.buttonLarge(
                context,
              ).copyWith(letterSpacing: 2, color: AppColors.addAlarmButtonText),
            ),
          ],
        ),
      ),
    );
  }
}
