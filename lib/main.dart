import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/home_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// late SharedPreferences nPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // nPrefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontier Airlines',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
