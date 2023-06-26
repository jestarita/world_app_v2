import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_app_v2/screens/countries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Country list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 4, 255)),
        useMaterial3: true,
      ),
      home: const Countries(title: 'All Countries', region: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}
