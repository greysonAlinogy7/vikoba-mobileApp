import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/User.dart';

class Service {
  // Constant for the API base URL
  static const String _baseUrl = 'http://localhost:8080/api/users';

  Future<User> createUser(Map<String, dynamic> userData) async {
    final url = Uri.parse(_baseUrl);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData), // Encode the user data as JSON
      );

      if (response.statusCode == 201) {
        // Parse the response body into a User object
        final jsonResponse = json.decode(response.body);
        return User.fromJson(jsonResponse);
      } else {
        throw Exception(
          'Failed to create user: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (error) {
      // Log the error and rethrow it for the caller to handle
      print('Error creating user: $error');
      rethrow; // Allows the caller to handle the error
    }
  }
}
