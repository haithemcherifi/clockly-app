import 'package:clockly_app/core/services/prayer_times_service.dart';
import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/adhan_settings_state.dart';
import 'package:clockly_app/features/adhan%20settings/data/model/prayer_times_model.dart';
import 'package:clockly_app/features/adhan%20settings/manager/cubit/adhan_settings_cubit.dart';
import 'package:clockly_app/features/adhan%20settings/views/widgets/adhan_sound.dart';
import 'package:clockly_app/features/adhan%20settings/views/widgets/current_location_card.dart';
import 'package:clockly_app/features/adhan%20settings/views/widgets/master_volume_card.dart';
import 'package:clockly_app/features/adhan%20settings/views/widgets/prayer_notification_card.dart';
import 'package:clockly_app/features/adhan%20settings/views/widgets/prayer_title.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdhanView extends StatefulWidget {
  const AdhanView({super.key});

  @override
  State<AdhanView> createState() => _AdhanViewState();
}

class _AdhanViewState extends State<AdhanView> {
  PrayerTimesModel? prayerTimes;
  bool isPrayerTimesLoading = false;

  String getPrayerTimeByName(String prayerName) {
    if (prayerTimes == null) return '--:--';

    switch (prayerName) {
      case 'Fajr':
        return prayerTimes!.fajr;
      case 'Dhuhr':
        return prayerTimes!.dhuhr;
      case 'Asr':
        return prayerTimes!.asr;
      case 'Maghrib':
        return prayerTimes!.maghrib;
      case 'Isha':
        return prayerTimes!.isha;
      default:
        return '--:--';
    }
  }

  Future<void> loadPrayerTimesFromLocation() async {
    final locationState = context.read<LocationCubit>().state;

    if (locationState.latitude == null || locationState.longitude == null) {
      return;
    }

    setState(() {
      isPrayerTimesLoading = true;
    });

    try {
      final service = PrayerTimesService();

      final result = await service.fetchPrayerTimes(
        latitude: locationState.latitude!,
        longitude: locationState.longitude!,
      );

      setState(() {
        prayerTimes = result;
        isPrayerTimesLoading = false;
      });
    } catch (e) {
      setState(() {
        isPrayerTimesLoading = false;
      });
      print('Prayer times error: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdhanSettingsCubit>().loadSettingsFromFirebase();
      loadPrayerTimesFromLocation();
    });
  }

  Future<void> selectAdhanSound() async {
    final sounds = [
      'Makkah (Al-Haram)',
      'Madinah',
      'Egypt',
      'Turkey',
      'Custom Sound',
    ];

    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: sounds.map((sound) {
              return ListTile(
                title: Text(sound),
                onTap: () {
                  Navigator.pop(context, sound);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (result != null) {
      context.read<AdhanSettingsCubit>().changeAdhanSound(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdhanSettingsCubit, AdhanSettingsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  PrayerNotificationCard(
                    value: state.prayerNotificationsEnabled,
                    onChanged: (value) {
                      context
                          .read<AdhanSettingsCubit>()
                          .togglePrayerNotifications(value);
                    },
                  ),
                  SizedBox(height: 20),
                  CurrentLocationCard(),
                  SizedBox(height: 16),
                  AdhanSound(
                    selectedAdhanSound: state.selectedAdhanSound,
                    onTap: selectAdhanSound,
                  ),
                  SizedBox(height: 16),
                  MasterVolumeCard(
                    masterVolume: state.masterVolume,
                    onChanged: (value) {
                      context.read<AdhanSettingsCubit>().changeMasterVolume(
                        value,
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PRAYER TIMES & ALERTS',
                      style: AppTextStyles.labelMedium(context).copyWith(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),

                  Column(
                    children: List.generate(state.prayers.length, (index) {
                      final prayer = state.prayers[index];
                      final updatedPrayer = prayer.copyWith(
                        time: getPrayerTimeByName(prayer.name),
                      );

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: PrayerTile(
                          prayer: updatedPrayer,
                          onChanged: (value) {
                            context.read<AdhanSettingsCubit>().togglePrayer(
                              index,
                              value,
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
