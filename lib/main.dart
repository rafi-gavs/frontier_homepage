import 'package:flutter/material.dart';
import 'package:frontier_homepage/core/di/di.dart';
import 'package:frontier_homepage/routes.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_page.dart';
import 'package:frontier_homepage/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontier Airlines',
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.flightStatus,
    );
  }
}
