import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/User.dart';

class AuthResponse {
  final String token;
  final String message;

  AuthResponse({required this.token, required this.message});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
    );
  }
}

class Service {
  static const String _baseUrl = 'http://172.16.130.106:8080/auth';

  /// Register a new user
  /// Optional token for admin-only registration
  Future<User?> createUser(
    Map<String, dynamic> userData, [
    String? token,
  ]) async {
    final url = Uri.parse("$_baseUrl/register");

    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return User.fromJson(jsonResponse);
      } else {
        print(
          '❌ Failed to create user: ${response.statusCode} - ${response.body}',
        );
        return null;
      }
    } catch (error) {
      print('⚠️ Error creating user: $error');
      return null;
    }
  }

  /// Login user
  Future<AuthResponse?> login(String email, String password) async {
    final url = Uri.parse("$_baseUrl/login");
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return AuthResponse.fromJson(jsonResponse);
      } else {
        print('❌ Login failed: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (error) {
      print('⚠️ Error during login: $error');
      return null;
    }
  }
}
