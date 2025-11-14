// import 'package:http/http.dart' as http;
//
// const String apiKey = "";
//
// class WeatherApiService{
//
//   final String  _baseUrl = "https://home.openweathermap.org/v1";
//   Future<Map<String,dynamic>> getHourlyForecast(String location) async{
//     final url = Uri.parse("_baseUrl/forecast.json?key=$apiKey&q=$location&days=7");
//     // final url = Uri.parse(
//     //   "_baseUrl/forecast.json?key=$apiKey&q=$location&days=7",
//     // );
//     final res = await http.get(url);
//     if(res.statusCode !=200){
//       throw Exception("Failed to fetch data: ${res.body}");
//     }
//
//
//
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_report_app/model/weather_model.dart';

String apiKey = "585a92cdbedb20552ac91724e09e33a6";

class WeatherApi {
  final String baseUrl = "https://home.openweathermap.org/v1/current.json";

  Future<ApiResponse> getWeather(String location) async {
    String apiUrl;
    if (location.isEmpty) {
      apiUrl = "$baseUrl?key=$apiKey&q=";
    } else {
      apiUrl = "$baseUrl?key=$apiKey&q=$location";
    }
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load weather");
      }
    } catch (e) {
      throw Exception("Failed to load weather");
    }
  }

  Future<ApiResponse> getCurrentWeatherByLatLong(
      double latitude, double longitude) async {
    String apiUrl = "$baseUrl?key=$apiKey&q=$latitude,$longitude";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load weather");
      }
    } catch (e) {
      throw Exception("Failed to load weather");
    }
  }
}

class LocationService {
  Future<Position> getLocation() async {
    PermissionStatus permission = await Permission.location.request();

    if (permission == PermissionStatus.granted) {
      try {
        return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      } catch (e) {
        throw Exception("Failed to get location: $e");
      }
    } else if (permission == PermissionStatus.denied) {
      throw const PermissionDeniedException(
          "Location permission denied by user");
    } else {
      throw Exception("Location permission not granted");
    }
  }
}