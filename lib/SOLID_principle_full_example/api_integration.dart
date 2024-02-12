import 'package:dio/dio.dart';

import 'model_class.dart';

abstract class UniversityFetcher {
  Future<List<University>> fetchUniversities();
}

class DioUniversityFetcher implements UniversityFetcher {
  final Dio _dio = Dio();

  @override
  Future<List<University>> fetchUniversities() async {
    try {
      final response = await _dio.get(
          'http://universities.hipolabs.com/search?country=United+States');
      return (response.data as List)
          .map((json) =>
          University(name: json['name'], country: json['country']))
          .toList();
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
