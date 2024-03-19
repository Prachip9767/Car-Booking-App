import 'package:car_bookig_app/model/car_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Car>> fetchCars() async {
    try {
      final response = await _dio.post(
        'http://114.29.232.154/connectus-dummy/api/v1/GetAllDetails',
        queryParameters: {'type': 'CAR'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Car.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
