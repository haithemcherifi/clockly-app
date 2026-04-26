import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/dashboard/views/widgets/quick_access_card.dart';
import 'package:flutter/material.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'QUICK ACCESS',
            style: AppTextStyles.labelLarge(context).copyWith(
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
              color: AppColors.dashboardHeaderMeta,
            ),
          ),
        ),
        SizedBox(height: 15),

        GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 1.55,
          children: [
            QuickAccessCard(
              icon: Icons.alarm,
              label: 'Alarms',
              iconColor: AppColors.summaryIcon,
              onTap: () {},
            ),
            QuickAccessCard(
              icon: Icons.mosque,
              label: 'Adhan',
              iconColor: const Color(0xFF2F7D3D),
              backgroundColor: AppColors.quickAccessHighlightedCard,
              borderColor: const Color(0xFFCFE4D1),
              onTap: () {},
            ),
            QuickAccessCard(
              icon: Icons.display_settings_outlined,
              label: 'Display',
              iconColor: AppColors.quickAccessIcon,
              onTap: () {},
            ),
            QuickAccessCard(
              icon: Icons.settings_remote_outlined,
              label: 'Device',
              iconColor: AppColors.iconSecondary,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
