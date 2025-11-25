import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_report_app/contants/app_colors.dart';
import 'package:weather_report_app/screens/forecast_screen/forecast_screen.dart';
import 'package:weather_report_app/screens/search_screen/search_screen.dart';
import 'package:weather_report_app/screens/weather_detail_screen/weather_detail_screen.dart';
import 'package:weather_report_app/screens/weather_screen/weather_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _screens =[
  const WeatherScreen(),
  const SearchScreen(),
  const ForecastScreen(),

];
int _currentPageIndex = 0;
final _destinations = const [
  NavigationDestination(icon: Icon(CupertinoIcons.home),
    label: 'Home',
    selectedIcon: Icon(CupertinoIcons.home, color: Colors.orange,),
  ),
  NavigationDestination(icon: Icon(CupertinoIcons.search),
    label: 'Search',
    selectedIcon: Icon(CupertinoIcons.search, color: Colors.orange,),
  ),
  NavigationDestination(icon: Icon(CupertinoIcons.cloud_moon_bolt),
    label: 'Weather',
    selectedIcon: Icon(CupertinoIcons.cloud_moon_bolt, color: Colors.orange,),
  ),

];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
       body: _screens[_currentPageIndex],
       bottomNavigationBar: NavigationBarTheme(
         data: NavigationBarThemeData(
           backgroundColor: AppColors.secondaryBlack
         ),
         child: NavigationBar(destinations: _destinations,
         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
         selectedIndex: _currentPageIndex ,
           indicatorColor: Colors.transparent,
           onDestinationSelected: (index){
           setState(() {
             _currentPageIndex = index;
           });
           },
         ),
       ),
    );
  }
}
