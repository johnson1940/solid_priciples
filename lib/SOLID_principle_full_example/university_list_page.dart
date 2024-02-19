import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_principles/SOLID_principle_full_example/university_provider.dart';
import 'package:solid_principles/SOLID_principle_full_example/webView_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOLID DEMO'),
        backgroundColor: Colors.indigo,
      ),
      body: Consumer<DataProvider>(
        builder: (_, dataProvider, __) {
          if (dataProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataProvider.hasError) {
            return Center(
              child: Text('Error: ${dataProvider.errorMessage}'),
            );
          } else {
            return ListView.builder(
              itemCount: dataProvider.data.length,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    title: Text(dataProvider.data[index].name),
                    subtitle: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebViewScreen(url: dataProvider.data[index].webPage.join(''))),
                        );
                      },
                      child: Text(dataProvider.data[index].webPage.join(''),
                        style: const TextStyle(color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
