import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:management/models/user.dart';

class UserService {
  static const String baseUrl = "http://localhost:3606";

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
