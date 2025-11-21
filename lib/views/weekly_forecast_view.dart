import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_report_app/Provider/weekly_weather_provider.dart';
import 'package:weather_report_app/contants/app_colors.dart';
import 'package:weather_report_app/contants/text_styles.dart';
import 'package:weather_report_app/extensions/datetime.dart';
import 'package:weather_report_app/widgets/subscript_text.dart';

import '../utils/get_weather_icons.dart';

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
              return WeeklyForecastTile(
                date: date,
                day: dayOfWeek,
                icon: getWeatherIcon2(icon),
                temp: temp.round(),
              );
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

class WeeklyForecastTile extends StatelessWidget {
  const WeeklyForecastTile({super.key, required this.day, required this.date, required this.temp, required this.icon});

  final String day;
  final String date;
  final int temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       padding: EdgeInsets.symmetric(
         vertical: 12,
       ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          children: [
             Text(day,style: TextStyles.h3,),
            const SizedBox(height: 5,),
            Text(day,style: TextStyles.subtitleText,),


          ],
        ),
          SuperscriptText(
              text: temp.toString(),
              superScript: "°C",
              color: AppColors.white,
              superscriptColor: AppColors.grey
          ),
          Image.asset(
            icon,
            width: 60,
          ),
        ],
      ),
    );
  }
}
