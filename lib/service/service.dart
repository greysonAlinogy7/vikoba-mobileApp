import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/User.dart';

class Service {
  // API base URL (change depending on platform)
  static const String _baseUrl = 'http://172.16.130.183:8080/auth/register';


  /// Create a new user
  Future<User?> createUser(Map<String, dynamic> userData) async {
    final url = Uri.parse(_baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData), // Encode the user data as JSON
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Parse the response body into a User object
        final jsonResponse = jsonDecode(response.body);
        return User.fromJson(jsonResponse);
      } else {
        print(
          'Failed to create user: ${response.statusCode} - ${response.body}',
        );
        return null; // Return null instead of throwing directly
      }
    } catch (error) {
      print('Error creating user: $error');
      return null; // Return null so caller can handle gracefully
    }
  }
}
