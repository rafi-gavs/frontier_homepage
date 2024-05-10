import 'package:flutter/material.dart';
import 'package:frontier_homepage/routes.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute:Routes.home,
    );
  }
}
