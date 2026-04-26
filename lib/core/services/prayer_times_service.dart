import 'dart:convert';
import 'package:clockly_app/features/adhan%20settings/data/model/prayer_times_model.dart';
import 'package:http/http.dart' as http;

class PrayerTimesService {
  Future<PrayerTimesModel> fetchPrayerTimes({
    required double latitude,
    required double longitude,
  }) async {
    final today = DateTime.now();
    final date =
        '${today.day.toString().padLeft(2, '0')}-'
        '${today.month.toString().padLeft(2, '0')}-'
        '${today.year}';

    final uri = Uri.parse(
      'https://api.aladhan.com/v1/timings/$date'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&method=2',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch prayer times');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return PrayerTimesModel.fromApi(data);
  }
}
