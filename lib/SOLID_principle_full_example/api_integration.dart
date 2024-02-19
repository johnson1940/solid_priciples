import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'model_class.dart';

abstract class ApiService extends ChangeNotifier{
  Future<List<UniversityModel>> fetchProducts();
}

class MyAwesomeApi extends ApiService with DioMixin implements ChangeNotifier{
  late Dio _dio;

  MyAwesomeApi(this._dio);

  @override
  Future<List<UniversityModel>> fetchProducts() async {
    try {
      final response = await _dio.get('http://universities.hipolabs.com/search?country=United+States');
      return List<UniversityModel>.from(
          response.data.map((json) => UniversityModel.fromJson(json)));
    } catch (error) {
      // Handle error gracefully and return empty list or throw
      return [];
    }
  }
}