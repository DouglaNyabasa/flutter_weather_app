import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_report_app/Provider/current_weather_provider.dart';
import 'package:weather_report_app/contants/text_styles.dart';
import 'package:weather_report_app/extensions/datetime.dart';
import 'package:weather_report_app/views/gradient_container.dart';
import 'package:weather_report_app/views/hourly_weather_forecast.dart';

import '../../views/weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);
    return weatherData.when(
        data: (weather){
          return  GradientContainer(
              children: [
                const SizedBox(width: double.infinity,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(weather.name, style: TextStyles.h1,),
                    const SizedBox(height: 20,),
                    Text(DateTime.now().dateTime,style: TextStyles.subtitleText,),
                    const SizedBox(height: 30,),
                    SizedBox(height: 260,
                      child: Image.asset('assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png'),
                    ),
                    const SizedBox(height: 40,),
                    Text(weather.weather[0].description, style: TextStyles.h2,),
                     ],
                ),
                const SizedBox(height: 40,),
                WeatherInfo(weather: weather),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Today', style: TextStyles.h2,),
                    TextButton(onPressed: (){}, child: const Text("View full Forecast",style: TextStyle(color: Colors.grey),))
                  ],
                ),
                const SizedBox(height: 15,),
                HourlyWeatherForecast(),



              ]);
        },
        error: (error,stackTrace){
          return Center(
            child: Text(error.toString()),
          );
        },
        loading:(){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
