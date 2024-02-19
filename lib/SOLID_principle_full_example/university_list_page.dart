import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_principles/SOLID_principle_full_example/university_provider.dart';
import 'package:solid_principles/SOLID_principle_full_example/university_viewModel.dart';
import 'package:solid_principles/SOLID_principle_full_example/webView_page.dart';


/// Single Responsibility Principle (SRP):
/// UniversityModel holds university information.
/// ApiService focuses on API interaction.
/// ProductListProvider manages product data.
/// UniversityListViewModel exposes data and state to the UI.
/// WebViewScreen handles web view logic.


/// Open/Closed Principle (OCP):
/// WebViewScreen can accept different URLs through its constructor.
/// You could potentially extend ApiService for different API endpoints.

/// Liskov Substitution Principle (LSP) :
///


class UniversityListPage extends StatefulWidget {
  const UniversityListPage({super.key});

  @override
  UniversityListPageState createState() => UniversityListPageState();
}

class UniversityListPageState extends State<UniversityListPage> {
  @override
  void initState() {
    super.initState();
    // Fetch products on app launch using the injected provider
    context.read<ProductListProvider>().fetchProducts();
   // Provider.of<ProductListProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UniversityListViewModel>(context);

    // Handle loading and error states gracefully
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(
        child: Text('Error fetching products: ${viewModel.error}'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('UNIVERSITY'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: viewModel.products.length,
        itemBuilder: (context, index) {
          final product = viewModel.products[index];
          return Card(
            child: ListTile(
              title: Text(product.name,style: const TextStyle(color: Colors.black),),
              // trailing: Text(product.country, style: const TextStyle(color: Colors.grey),),
               subtitle: GestureDetector(
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => WebViewScreen(url: product.webPage.join(''))),
                   );
                 },
                 child: Text(product.webPage.join(''),
                   style: const TextStyle(color: Colors.grey,
                       decoration: TextDecoration.underline,
                   ),
                 ),
               ),
            ),
          );
        },
      ),
    );
  }
}