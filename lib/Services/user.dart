import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:management/models/user.dart';

class UserService {
  static const String baseUrl = "http://localhost:8080";

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }




  Future<String> register(Map<String, dynamic> userData) async{
    final response = await http.post(
        Uri.parse('$baseUrl/register'),
      body: jsonEncode(userData),
      headers: {'Content-type': 'application/json'},
    );
    return response.body;
  }

  Future<String> login(Map<String, dynamic> credentials) async {
    final response = await http.post(
    Uri.parse('$baseUrl/login'),
    body: jsonEncode(credentials),
    headers: {'Content-Type': 'application/json'},
    );
    return response.body;
  }

  Future<String> logout(String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.body;
  }

}
