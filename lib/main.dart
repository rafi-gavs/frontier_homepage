import 'package:flutter/material.dart';
import 'package:frontier_homepage/platform_communication/event_channel_handler.dart';
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

class MyApp extends StatefulWidget {
  final Widget child;
  const MyApp({
    super.key,
    required this.child,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _eventChannelHandler = EventChannelHandler();

  @override
  void initState() {
    _eventChannelHandler.listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontier Airlines',
      home: widget.child,
    );
  }
}
