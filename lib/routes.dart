import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_page.dart';
import 'package:frontier_homepage/screens/home_page.dart';

class Routes {
  static const home = '/';
  static const flightStatus = 'flight_status';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'flight_status':
        return MaterialPageRoute(builder: (_) => const FlightStatusPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
