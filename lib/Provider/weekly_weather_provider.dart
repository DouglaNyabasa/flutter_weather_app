

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_report_app/service/api_helper.dart';

final weeklyWeatherProvider = FutureProvider.autoDispose((ref){
  return ApiHelper.getWeeklyForecast();
});