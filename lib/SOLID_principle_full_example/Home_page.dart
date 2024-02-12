import 'package:flutter/material.dart';
import 'api_integration.dart';
import 'model_class.dart';


class HomePage extends StatefulWidget {
  final UniversityFetcher fetcher;

  const HomePage({Key? key, required this.fetcher}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<University>> universities;

  @override
  void initState() {
    super.initState();
    universities = widget.fetcher.fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities in the United States'),
      ),
      body: FutureBuilder<List<University>>(
        future: universities,
        builder: (context, universityData) {
          if (universityData.connectionState == ConnectionState.waiting) {
            return const
            Center(
                child: CircularProgressIndicator()
            );
          } else if (universityData.hasError) {
            return Text('Error fetching data: ${universityData.error}');
          } else {
            return ListView.builder(
              itemCount: universityData.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(universityData.data?[index].name ?? ''),
                  subtitle: Text(universityData.data?[index].country ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}