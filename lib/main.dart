import 'package:flutter/material.dart';
import 'package:frontier_homepage/routes.dart';
import 'package:frontier_homepage/utils/app_theme.dart';

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
    return  MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Frontier Airlines',
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
