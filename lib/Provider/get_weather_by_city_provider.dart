

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_report_app/model/weather.dart';
import 'package:weather_report_app/service/api_helper.dart';

final getWeatherByCityNameProvider = FutureProvider.autoDispose.family<Weather,String>((ref,String cityName){
  return ApiHelper.getWeatherByCityName(cityName: cityName);
});