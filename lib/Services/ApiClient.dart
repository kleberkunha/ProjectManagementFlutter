import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://localhost:8080/login', // Replace with your login API endpoint
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check if login was successful
      if (response.statusCode == 200) {
        // Navigate to the next screen after successful login
        // Replace 'HomeScreen' with the name of your screen
        _router.go('home')
      }

      return response;
    } catch (e) {
      // Handle errors
      print('Error occurred during login: $e');
      rethrow;
    }
  }
}
