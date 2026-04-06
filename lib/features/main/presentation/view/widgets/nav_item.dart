import 'package:clockly_app/core/utils/app_color.dart';
import 'package:clockly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.context,
    required this.icon,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final IconData icon;
  final BuildContext context;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bottomNavSelected : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? AppColors.bottomNavSelectedText
                  : AppColors.bottomNavUnselected,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.bottomNavSelected(context)
                  : AppTextStyles.bottomNavUnselected(context),
            ),
          ],
        ),
      ),
    );
  }
}
