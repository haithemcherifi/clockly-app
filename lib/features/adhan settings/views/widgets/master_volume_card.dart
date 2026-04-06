import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MasterVolumeCard extends StatelessWidget {
  const MasterVolumeCard({
    super.key,
    required this.masterVolume,
    required this.onChanged,
  });

  final double masterVolume;
  final ValueChanged<double> onChanged;

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
                Icons.volume_up,
                size: 20,
                color: AppColors.locationIcon,
              ),
              const SizedBox(width: 8),
              Text(
                'MASTER VOLUME',
                style: AppTextStyles.labelMedium(context).copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                '${masterVolume.toInt()}%',
                style: AppTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.volumeValue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: AppColors.volumeFill,
              inactiveTrackColor: AppColors.volumeTrack,
              thumbColor: AppColors.volumeFill,
            ),
            child: Slider(
              value: masterVolume,
              min: 0,
              max: 100,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
