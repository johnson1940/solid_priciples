import 'package:flutter/cupertino.dart';
import 'package:solid_principles/SOLID_principle_full_example/university_provider.dart';

import 'model_class.dart';

class UniversityListViewModel extends ChangeNotifier {
  final ProductListProvider _provider;

  UniversityListViewModel(this._provider) {
    _listenToProvider();
  }

  _listenToProvider() {
    _provider.addListener(() {
      notifyListeners();
    });
  }

  bool get isLoading => _provider.isLoading;
  String? get error => _provider.error;
  List<UniversityModel> get products => _provider.products;

  @override
  void dispose() {
    super.dispose();
    _provider.removeListener(_listenToProvider);
  }
}
