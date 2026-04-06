import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AdhanSound extends StatelessWidget {
  const AdhanSound({
    super.key,
    required this.selectedAdhanSound,
    required this.onTap,
  });

  final String selectedAdhanSound;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.dropdownCard,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.library_music,
                size: 20,
                color: AppColors.locationIcon,
              ),
              const SizedBox(width: 8),
              Text(
                'ADHAN SOUND',
                style: AppTextStyles.labelMedium(context).copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.locationIcon,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.softSurface,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedAdhanSound,
                      style: AppTextStyles.bodyLarge(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.dropdownText,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.dropdownArrow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
