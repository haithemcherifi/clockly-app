import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/features/adhan%20settings/views/adhan_view.dart';
import 'package:clockly_app/features/alarm%20management/views/alarm_management_view.dart';
import 'package:clockly_app/features/dashboard/views/dashoard_view.dart';
import 'package:clockly_app/features/dashboard/views/widgets/dashboard_top.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/nav_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/widgets/custom_bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const List<Widget> screens = [
    DashboardScreen(),
    AlarmManagementView(),
    AdhanView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, index) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          body: Padding(
            padding: const EdgeInsets.only(top: 40, right: 23, left: 23),
            child: Column(
              children: [
                DashboredTop(),
                SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    children: List.generate(screens.length, (i) {
                      return Offstage(
                        offstage: index != i,
                        child: TickerMode(
                          enabled: index == i,
                          child: screens[i],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomnavigationbar(index: index),
        );
      },
    );
  }
}
