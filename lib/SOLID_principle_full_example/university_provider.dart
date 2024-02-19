import 'package:flutter/cupertino.dart';

import 'api_integration.dart';
import 'model_class.dart';

class ProductListProvider with ChangeNotifier {
  final ApiService _apiService;
  List<UniversityModel> _products = [];
  bool _isLoading = false;
  String? _error;

  ProductListProvider(this._apiService);

  List<UniversityModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;

    try {
      _products = await _apiService.fetchProducts();
      notifyListeners();
    } catch (error) {
      _error = 'Error fetching products: $error';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

