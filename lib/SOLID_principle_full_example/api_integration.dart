import 'package:dio/dio.dart';
import 'model_class.dart';


abstract class ApiServiceInterface {
  Future<List<Post>> getPosts();
}

class ApiService implements ApiServiceInterface {
  final Dio dio = Dio();

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await dio.get('http://universities.hipolabs.com/search?country=United+States');
      final data = response.data as List<dynamic>;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
