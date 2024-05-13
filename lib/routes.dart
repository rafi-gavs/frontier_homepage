import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status_page/flight_status_page.dart';
import 'package:frontier_homepage/screens/home_page/home_page.dart';
import 'screens/flight_status_page/individual_search_result_page.dart';

class Routes {
  static const home = '/';
  static const flightStatus = 'flight_status';
  static const flightStatusIndividualResult = 'flight_status_individual_result';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'flight_status':
        return MaterialPageRoute(builder: (_) => const FlightStatusPage());
      case 'flight_status_individual_result':
        return MaterialPageRoute(builder: (_) => const IndividualSearchResultPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
