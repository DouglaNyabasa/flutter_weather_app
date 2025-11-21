import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_report_app/model/famous_city.dart';
import 'package:weather_report_app/screens/weather_detail_screen/weather_detail_screen.dart';
import 'package:weather_report_app/widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: famousCities.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
          mainAxisSpacing: 20,

        ),
        itemBuilder: (context,index){
          final city = famousCities[index];
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> WeatherDetailScreen(cityName: city.name)));
            },
            child: FamousCityTile(
                city: city.name,
                index: index

            ),
          );
        });
  }
}
