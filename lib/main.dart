import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SOLID_principle_full_example/api_integration.dart';
import 'SOLID_principle_full_example/university_list_page.dart';
import 'SOLID_principle_full_example/university_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
        ChangeNotifierProvider<DataProvider>(
          create: (_) => DataProvider(apiService: ApiService()),
        ),
      ],
      child: const MaterialApp(
        title: 'SOLID Demo',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
/*
SINGLE RESPONSIBILITY PRINCIPLE : (SRP)
 Each class one job or responsibility. For example,
  -> the ApiService class is responsible for making API requests,
  -> the DataProvider class is responsible for managing the app's data,
  -> and the HomePage class is responsible for displaying the data in a list.
  -> The webView class is responsible for web view rendering

OPEN CLOSED PRINCIPLE : (OCP)
  Open for Modification and closed for Modification
  -> If we wanted to add a new feature to this app,
  -> we could do so by adding new classes and functions without modifying the existing code.
  -> Adding new API endpoints wouldn't affect existing code.
  -> Expanding the Post model with new fields wouldn't break existing functionalities.

LISKOV SUBSTITUTION PRINCIPLE : (LSP)
 This code follows the LSP because it uses interfaces to ensure
 that subclasses can be used interchangeably with their parent classes.
 -> The ApiService class correctly implements the getPosts method defined in the ApiServiceInterface.
 -> The method signature in the derived class matches the method signature in the base interface, adhering to LSP.


 */

