import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/features/adhan%20settings/manager/cubit/adhan_settings_cubit.dart';
import 'package:clockly_app/features/adhan%20settings/views/adhan_view.dart';
import 'package:clockly_app/features/alarm%20management/manager/cubit/alarm_cubit.dart';
import 'package:clockly_app/features/alarm%20management/views/alarm_management_view.dart';
import 'package:clockly_app/features/dashboard/views/dashoard_view.dart';
import 'package:clockly_app/features/dashboard/views/widgets/dashboard_top.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_state.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/nav_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/widgets/custom_bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const List<Widget> screens = [
    DashboardScreen(),
    AlarmManagementView(),
    AdhanView(),
  ];

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();

    context.read<LocationCubit>().requestAndFetchLocation();
    context.read<AdhanSettingsCubit>().loadSettingsFromFirebase();
    context.read<AlarmCubit>().loadAlarmsFromFirebase();

    /// 🔥 ADD THIS
    Future.microtask(() {
      final locationState = context.read<LocationCubit>().state;

      if (locationState.latitude != null && locationState.longitude != null) {
        context.read<AdhanSettingsCubit>().loadPrayerTimes(
          latitude: locationState.latitude!,
          longitude: locationState.longitude!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, locationState) {
        if (locationState.isLoading) {
          return const Scaffold(
            backgroundColor: AppColors.scaffoldBackground,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!locationState.hasPermission) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBackground,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_off_rounded,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Location is required',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enable location to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LocationCubit>().requestAndFetchLocation();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text('Enable Location'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return BlocBuilder<NavCubit, int>(
          builder: (context, index) {
            return Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              body: Padding(
                padding: const EdgeInsets.only(top: 40, right: 28, left: 28),
                child: Column(
                  children: [
                    DashboredTop(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: List.generate(MainView.screens.length, (i) {
                          return Offstage(
                            offstage: index != i,
                            child: TickerMode(
                              enabled: index == i,
                              child: MainView.screens[i],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: CustomBottomnavigationbar(index: index),
              ),
            );
          },
        );
      },
    );
  }
}
