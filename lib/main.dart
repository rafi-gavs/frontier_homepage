import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_page.dart';
import 'package:frontier_homepage/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:native_shared_preferences/native_shared_preferences.dart';

// late NativeSharedPreferences nPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  homePage();
}

void homePage() {
  runApp(const MyApp(child: HomePage()));
}

void flightStatusPage() {
  runApp(const MyApp(child: FlightStatusPage()));
}

class MyApp extends StatelessWidget {
  final Widget child;
  const MyApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontier Airlines',
      home: child,
    );
  }
}
