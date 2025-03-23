// api_service.dart
import 'package:http/http.dart' as http;
import 'package:untitled1/shared_prefs.dart';
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  // Registration API call
  static Future<bool> registerUser(String email, String password, context) async {
    final String url = '$baseUrl/register';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String? token = responseData['token'];
        if (token != null) {
          await SharedPrefs.saveToken(token);
          return true;
        }
      } else {
        print('Registration failed: ${response.body}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
    return false;
  }

  // Login API call
  static Future<bool> loginUser(String email, String password, context) async {
    final String url = '$baseUrl/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String? token = responseData['token'];
        if (token != null) {
          await SharedPrefs.saveToken(token);
          return true;
        }
      } else {
        print('Login failed: ${response.body}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return false;
  }

  // Fetch Users API call
  static Future<List<dynamic>> fetchUsers() async {
    final String url = '$baseUrl/users?page=2';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['data'];
      } else {
        print('Failed to fetch users: ${response.body}');
      }
    } catch (e) {
      print('Error during fetching users: $e');
    }
    return [];
  }
}
