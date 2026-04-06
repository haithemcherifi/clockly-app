import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ConnectedAndLocation extends StatelessWidget {
  const ConnectedAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // CONNECTED BADGE
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.connectionBadgeBg,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2F7D3D),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'CONNECTED',
                style: AppTextStyles.successText(
                  context,
                ).copyWith(letterSpacing: 2),
              ),
            ],
          ),
        ),

        // LOCATION
        Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 18,
              color: AppColors.dashboardHeaderMeta,
            ),
            const SizedBox(width: 6),
            Text(
              'London, UK',
              style: AppTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.dashboardHeaderTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
