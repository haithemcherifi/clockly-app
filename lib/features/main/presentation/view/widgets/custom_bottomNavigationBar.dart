import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/features/dashboard/views/dashoard_view.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/nav_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomnavigationbar extends StatelessWidget {
  const CustomBottomnavigationbar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bottomNavBackground,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              context: context,
              icon: Icons.dashboard,
              label: 'DASHBOARD',
              isSelected: index == 0,
              onTap: () {
                context.read<NavCubit>().changeTab(0);
              },
            ),
            NavItem(
              context: context,
              icon: Icons.alarm,
              label: 'ALARMS',
              isSelected: index == 1,
              onTap: () {
                context.read<NavCubit>().changeTab(1);
              },
            ),
            NavItem(
              context: context,
              icon: Icons.settings,
              label: 'SETTINGS',
              isSelected: index == 2,
              onTap: () {
                context.read<NavCubit>().changeTab(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
