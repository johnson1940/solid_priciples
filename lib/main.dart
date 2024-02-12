import 'package:flutter/material.dart';
import 'SOLID_principle_full_example/Home_page.dart';
import 'SOLID_principle_full_example/api_integration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Fetch Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(fetcher: DioUniversityFetcher()),
    );
  }
}
