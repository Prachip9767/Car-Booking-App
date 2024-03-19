import 'package:car_bookig_app/model/car_model.dart';
import 'package:flutter/material.dart';

import '../api_service/api_service.dart';

class CarProvider extends ChangeNotifier {
  List<Car> _cars = [];
  final ApiService _apiService = ApiService();

  List<Car> get cars => _cars;

  Future<void> fetchCars() async {
    try {
      _cars = await _apiService.fetchCars();
      notifyListeners();
    } catch (e) {
      print('Error fetching cars: $e');
    }
  }
}
