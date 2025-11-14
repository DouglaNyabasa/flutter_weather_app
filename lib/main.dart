import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_report_app/Provider/theme_provider.dart';
import 'package:weather_report_app/contants/Theme/Theme.dart';
import 'package:weather_report_app/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}
