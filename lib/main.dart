import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/home_page.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';

late NativeSharedPreferences nPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  nPrefs = await NativeSharedPreferences.getInstance();
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
