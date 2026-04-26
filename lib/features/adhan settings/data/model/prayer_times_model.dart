class PrayerTimesModel {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  const PrayerTimesModel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTimesModel.fromApi(Map<String, dynamic> json) {
    final timings = json['data']['timings'];

    String formatTo12Hour(String value) {
      final clean = value.split(' ').first; // remove timezone
      final parts = clean.split(':');

      int hour = int.parse(parts[0]);
      final minute = parts[1];

      final isAm = hour < 12;

      if (hour == 0) {
        hour = 12;
      } else if (hour > 12) {
        hour -= 12;
      }

      final period = isAm ? 'AM' : 'PM';

      final formattedHour = hour.toString().padLeft(2, '0');

      return '$formattedHour:$minute $period';
    }

    return PrayerTimesModel(
      fajr: formatTo12Hour(timings['Fajr']),
      dhuhr: formatTo12Hour(timings['Dhuhr']),
      asr: formatTo12Hour(timings['Asr']),
      maghrib: formatTo12Hour(timings['Maghrib']),
      isha: formatTo12Hour(timings['Isha']),
    );
  }
}
