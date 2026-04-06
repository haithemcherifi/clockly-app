import 'package:flutter/material.dart';
import 'package:clockly_app/core/utils/app_color.dart';

abstract final class AppTextStyles {
  // =========================================================
  // DISPLAY / BIG TEXT
  // =========================================================
  static TextStyle clockTime(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle screenTitle(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle textStyleBlack55(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 55),
      fontWeight: FontWeight.w900,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle sectionTitle(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  // =========================================================
  // HEADINGS
  // =========================================================
  static TextStyle cardTitle(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle dialogTitle(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle textStyleBold35(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 35),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle textStyleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  // =========================================================
  // BODY TEXT
  // =========================================================
  static TextStyle bodyLarge(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: AppColors.textSecondary,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: AppColors.textSecondary,
    );
  }

  // =========================================================
  // LABELS / META
  // =========================================================
  static TextStyle labelLarge(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle labelMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.textSecondary,
    );
  }

  static TextStyle labelSmall(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.textMuted,
    );
  }

  // =========================================================
  // BUTTONS
  // =========================================================
  static TextStyle buttonLarge(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.buttonPrimaryText,
    );
  }

  static TextStyle buttonMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.buttonPrimaryText,
    );
  }

  static TextStyle buttonSmall(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.buttonPrimaryText,
    );
  }

  // =========================================================
  // SPECIAL STATES
  // =========================================================
  static TextStyle successText(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.successText,
    );
  }

  static TextStyle infoText(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.infoText,
    );
  }

  static TextStyle chipSelected(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.chipSelectedText,
    );
  }

  static TextStyle chipUnselected(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.chipUnselectedText,
    );
  }

  // =========================================================
  // ALARM / SETTINGS SPECIFIC
  // =========================================================
  static TextStyle alarmTime(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle settingTitle(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle settingSubtitle(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: AppColors.textSecondary,
    );
  }

  static TextStyle bottomNavSelected(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.bottomNavSelectedText,
    );
  }

  static TextStyle bottomNavUnselected(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.bottomNavUnselectedText,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  final double width = MediaQuery.of(context).size.width;
  final double scaleFactor = width / 390;
  final double responsiveFontSize = fontSize * scaleFactor;

  final double lowerLimit = fontSize * 0.85;
  final double upperLimit = fontSize * 1.15;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
