import 'package:flutter/cupertino.dart';

import 'api_integration.dart';
import 'model_class.dart';

abstract class DataProviderInterface {
  bool get isLoading;
  bool get hasError;
  String get errorMessage;
  List<Post> get data;

  Future<void> loadData();
}

class DataProvider extends ChangeNotifier implements DataProviderInterface {
  final ApiServiceInterface apiService;

  DataProvider({required this.apiService}) {
    loadData();
  }

  bool _isLoading = true;
  @override
  bool get isLoading => _isLoading;

  bool _hasError = false;
  @override
  bool get hasError => _hasError;

  String _errorMessage = '';
  @override
  String get errorMessage => _errorMessage;

  List<Post> _data = [];
  @override
  List<Post> get data => _data;

  @override
  Future<void> loadData() async {
    try {
      _data = await apiService.getPosts();
      _isLoading = false;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}