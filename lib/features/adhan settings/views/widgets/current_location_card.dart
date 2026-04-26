import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';

import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.locationCard,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 20,
                color: AppColors.locationIcon,
              ),
              const SizedBox(width: 8),
              Text(
                'CURRENT LOCATION',
                style: AppTextStyles.labelMedium(context).copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.locationIcon,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.softSurface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                return Text(
                  state.locationText,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.locationValue,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'AUTO-DETECT ENABLED',
            style: AppTextStyles.labelSmall(context).copyWith(
              letterSpacing: 1.3,
              fontWeight: FontWeight.w700,
              color: AppColors.autoDetectText,
            ),
          ),
        ],
      ),
    );
  }
}
