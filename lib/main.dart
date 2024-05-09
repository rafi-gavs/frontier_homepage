import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_page.dart';
import 'package:frontier_homepage/screens/home_page.dart';
import 'package:frontier_homepage/util/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:native_shared_preferences/native_shared_preferences.dart';

// late NativeSharedPreferences nPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // nPrefs = await NativeSharedPreferences.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontier Airlines',
      theme: AppTheme.light,
      home: const FlightStatusPage(),
    );
  }
}
