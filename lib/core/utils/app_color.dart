import 'package:flutter/material.dart';

abstract final class AppColors {
  // =========================================================
  // CORE / GLOBAL
  // =========================================================
  static const Color primary = Color(0xFF0B6EA8);
  static const Color primaryDark = Color(0xFF085A8A);
  static const Color primaryLight = Color(0xFF4FA3E0);

  static const Color background = Color(0xFFF6F7F9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color softSurface = Color(0xFFF1F5F8);

  static const Color textPrimary = Color(0xFF1E232B);
  static const Color textSecondary = Color(0xFF6E7782);
  static const Color textMuted = Color(0xFFA7AFB8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static const Color border = Color(0xFFE7EBEF);
  static const Color divider = Color(0xFFEEF1F4);
  static const Color shadow = Color.fromARGB(18, 25, 35, 52);

  // =========================================================
  // COMMON / REUSABLE
  // =========================================================
  static const Color scaffoldBackground = background;
  static const Color cardBackground = surface;

  static const Color iconPrimary = primary;
  static const Color iconSecondary = Color(0xFF7C8794);

  static const Color buttonPrimary = primary;
  static const Color buttonPrimaryText = textOnPrimary;
  static const Color buttonDisabled = Color(0xFFD8DDE3);

  static const Color inputBackground = surface;
  static const Color inputBorder = border;
  static const Color inputHint = textMuted;
  static const Color cursorColor = primary;

  static const Color switchActive = Color(0xFF63C76A);
  static const Color switchInactive = Color(0xFFD7DCE2);
  static const Color switchThumb = Color(0xFFFFFFFF);

  static const Color chipSelected = Color(0xFF2F7D3D);
  static const Color chipUnselected = Color(0xFFE8EBEE);
  static const Color chipSelectedText = Color(0xFFFFFFFF);
  static const Color chipUnselectedText = Color(0xFF7B848E);

  static const Color successBg = Color(0xFFE4F8E6);
  static const Color successText = Color(0xFF2F8F46);

  static const Color infoBg = Color(0xFFEAF5FF);
  static const Color infoText = primary;

  // =========================================================
  // SPLASH SCREEN
  // =========================================================
  static const Color splashBackgroundTop = Color(0xFFD8EAFB);
  static const Color splashBackgroundBottom = Color(0xFFF3F7F4);

  static const Color splashLogoBackground = Color(0xFFFFFFFF);
  static const Color splashLogoIcon = primary;

  static const Color splashTitle = Color(0xFF1F242B);
  static const Color splashSubtitle = Color(0xFF8E97A3);

  static const Color splashIndicatorActive = primary;
  static const Color splashIndicatorInactive = Color(0xFFBFD3E4);

  static const Color splashPreviewCard = Color(0xFFD9DCDD);

  // =========================================================
  // DASHBOARD SCREEN
  // =========================================================
  static const Color dashboardHeaderTitle = textPrimary;
  static const Color dashboardHeaderMeta = textSecondary;

  static const Color connectionBadgeBg = successBg;
  static const Color connectionBadgeText = successText;

  static const Color currentTimeText = Color(0xFF20242A);
  static const Color currentDateText = Color(0xFF6E7782);

  static const Color summaryCard = Color(0xFFFFFFFF);
  static const Color summaryIconBg = Color(0xFFEAF5FF);
  static const Color summaryIcon = primary;
  static const Color summaryLabel = textSecondary;
  static const Color summaryValue = textPrimary;

  static const Color quickAccessCard = Color(0xFFFFFFFF);
  static const Color quickAccessHighlightedCard = Color(0xFFE2F2E3);
  static const Color quickAccessIcon = textPrimary;
  static const Color quickAccessLabel = textPrimary;

  static const Color quoteCardOverlay = Color.fromARGB(55, 0, 0, 0);
  static const Color quoteText = Color(0xFFFFFFFF);

  // =========================================================
  // ALARM MANAGEMENT SCREEN
  // =========================================================
  static const Color nextAlarmCard = primary;
  static const Color nextAlarmLabel = Color(0xFFCDE8FA);
  static const Color nextAlarmValue = Color(0xFFFFFFFF);
  static const Color nextAlarmMeta = Color(0xFFE9F5FE);

  static const Color alarmCard = Color(0xFFFFFFFF);
  static const Color alarmTimeActive = textPrimary;
  static const Color alarmTimeInactive = Color(0xFF9FA6AF);
  static const Color alarmLabel = textSecondary;

  static const Color weekdayChipActive = Color(0xFF2F7D3D);
  static const Color weekdayChipInactive = Color(0xFFE7EAEE);
  static const Color weekdayChipActiveText = Color(0xFFFFFFFF);
  static const Color weekdayChipInactiveText = Color(0xFF7D858F);

  static const Color addAlarmButton = primary;
  static const Color addAlarmButtonText = Color(0xFFFFFFFF);
  static const Color addAlarmButtonIcon = Color(0xFFFFFFFF);

  // =========================================================
  // ADD ALARM SCREEN
  // =========================================================
  static const Color addAlarmTitle = textPrimary;
  static const Color addAlarmAction = Color(0xFF4F8FEA);

  static const Color timePickerText = Color(0xFF1C2128);
  static const Color timePickerMeridiemBg = primary;
  static const Color timePickerMeridiemText = Color(0xFFFFFFFF);
  static const Color timePickerHelperText = textSecondary;

  static const Color repeatLabel = textSecondary;

  static const Color settingTileBackground = Color(0xFFFFFFFF);
  static const Color settingTileIconBg = Color(0xFFEAF5FF);
  static const Color settingTileIcon = primary;
  static const Color settingTileTitle = textPrimary;
  static const Color settingTileSubtitle = textSecondary;
  static const Color settingTileArrow = Color(0xFF88919C);

  static const Color saveAlarmButton = primary;
  static const Color saveAlarmButtonText = Color(0xFFFFFFFF);

  // =========================================================
  // ADHAN SETTINGS SCREEN
  // =========================================================
  static const Color prayerNotificationCard = Color(0xFFFFFFFF);
  static const Color prayerNotificationIconBg = Color(0xFFE7F6E7);
  static const Color prayerNotificationIcon = Color(0xFF58B95B);

  static const Color sectionHeader = textPrimary;
  static const Color sectionSubtleLabel = Color(0xFF7F8893);

  static const Color locationCard = Color(0xFFFFFFFF);
  static const Color locationIcon = primary;
  static const Color locationValue = textPrimary;
  static const Color autoDetectText = Color(0xFFB0B7C0);

  static const Color dropdownCard = Color(0xFFFFFFFF);
  static const Color dropdownText = textPrimary;
  static const Color dropdownArrow = Color(0xFF7F8893);

  static const Color volumeTrack = Color(0xFFDDE6EE);
  static const Color volumeFill = primary;
  static const Color volumeThumb = Color(0xFFFFFFFF);
  static const Color volumeValue = Color(0xFF4D89C9);

  static const Color prayerItemBackground = Color(0xFFFFFFFF);
  static const Color prayerName = textPrimary;
  static const Color prayerTime = textSecondary;

  static const Color reminderCard = Color(0xFF2B86C7);
  static const Color reminderTitle = Color(0xFFFFFFFF);
  static const Color reminderSubtitle = Color(0xFFD8EDFA);
  static const Color reminderButton = Color(0xFFFFFFFF);
  static const Color reminderButtonText = primary;

  // =========================================================
  // DISPLAY SETTINGS SCREEN
  // =========================================================
  static const Color brightnessLabel = textPrimary;
  static const Color sliderTrack = Color(0xFFDCE4EB);
  static const Color sliderFill = primary;
  static const Color sliderThumb = Color(0xFFFFFFFF);

  static const Color nightModeCard = Color(0xFFA8F0A7);
  static const Color nightModeTitle = Color(0xFF1D4223);
  static const Color nightModeSubtitle = Color(0xFF426347);

  static const Color segmentedBackground = Color(0xFFF0F2F5);
  static const Color segmentedSelected = Color(0xFF2F7D3D);
  static const Color segmentedSelectedText = Color(0xFFFFFFFF);
  static const Color segmentedUnselectedText = Color(0xFF6E7782);

  static const Color languageTile = Color(0xFFFFFFFF);
  static const Color languageTitle = textPrimary;
  static const Color languageValue = textSecondary;

  static const Color visualPreviewBorder = Color(0xFFE8EDF2);
  static const Color visualPreviewSelectedBorder = primary;

  // =========================================================
  // BOTTOM NAVIGATION
  // =========================================================
  static const Color bottomNavBackground = Color(0xFFFFFFFF);
  static const Color bottomNavSelected = Color.fromARGB(58, 93, 169, 228);
  static const Color bottomNavUnselected = Color(0xFF6F7782);
  static const Color bottomNavSelectedText = primary;
  static const Color bottomNavUnselectedText = Color(0xFF7C8590);
}
