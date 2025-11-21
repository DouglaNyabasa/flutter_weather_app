import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_report_app/Provider/weekly_weather_provider.dart';
import 'package:weather_report_app/extensions/datetime.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);
    
    return  weeklyForecastData.when(
        data: (weeklyweather){
          return ListView.builder(itemCount: weeklyweather.daily.weatherCode.length,
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              final dayOfWeek =
                  DateTime.parse(weeklyweather.daily.time[index]).dayOfWeek;
              final date = weeklyweather.daily.time[index];
              final temp = weeklyweather.daily.temperature2mMax[index];
              final icon = weeklyweather.daily.weatherCode[index];
            },
          );
        },
        error: (error, stakeTrace){
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: (){
          return CircularProgressIndicator();
        });
  }
}
