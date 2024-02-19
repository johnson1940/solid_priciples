import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SOLID_principle_full_example/api_integration.dart';
import 'SOLID_principle_full_example/university_list_page.dart';
import 'SOLID_principle_full_example/university_provider.dart';
import 'SOLID_principle_full_example/university_viewModel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Inject the concrete API implementation for flexibility
        ChangeNotifierProvider<ApiService>(
          create: (_) => MyAwesomeApi(Dio()), // Inject Dio instance into API
        ),
        ChangeNotifierProvider<ProductListProvider>(
          create: (context) => ProductListProvider(
            context.read<ApiService>(), // Provide injected API to provider
          ),
        ),
        // Provide the view model with access to the provider
        ChangeNotifierProvider<UniversityListViewModel>(
          create: (context) => UniversityListViewModel(
            Provider.of<ProductListProvider>(context,listen: false),
          ),
        ),
      ],
      child: const MaterialApp(
        home: UniversityListPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
