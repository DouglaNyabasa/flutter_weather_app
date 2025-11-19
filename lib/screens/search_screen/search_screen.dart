import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_report_app/contants/app_colors.dart';
import 'package:weather_report_app/contants/text_styles.dart';
import 'package:weather_report_app/views/famous_cities_view.dart';
import 'package:weather_report_app/views/gradient_container.dart';
import 'package:weather_report_app/widgets/rounded_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Pick A Location',
                style: TextStyles.h1,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Find the area or city that you want to know the detailed weather info at this time',
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RoundedTextField(
                controller: _controller,
              ),
            ),
            const SizedBox(width:20 ,),
            const LocationIcon(),

          ],
        ),
        const SizedBox(height:30 ,),

        FamousCitiesView(),


      ]),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: const Icon(Icons.location_on_outlined,color: Colors.white,),
    );
  }
}
