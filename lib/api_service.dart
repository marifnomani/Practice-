import 'package:http/http.dart' as http;
import 'package:untitled1/shared_prefs.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  // Registration API call
  static Future<bool> registerUser(String email, String password, context) async {
    final String url = '$baseUrl/register';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: '{"email": "$email", "password": "$password"}',
    );

    if (response.statusCode == 200) {
      final responseData = response.body;
      final token = RegExp(r'"token":\s*"([^"]+)"').firstMatch(responseData)?.group(1);
      if (token != null) {
        await SharedPrefs.saveToken(token);
        return true;
      }
    }
    return false;
  }

  // Login API call
  static Future<bool> loginUser(String email, String password, context) async {
    final String url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: '{"email": "$email", "password": "$password"}',
    );

    if (response.statusCode == 200) {
      final responseData = response.body;
      final token = RegExp(r'"token":\s*"([^"]+)"').firstMatch(responseData)?.group(1);
      if (token != null) {
        await SharedPrefs.saveToken(token);
        return true;
      }
    }
    return false;
  }
}
