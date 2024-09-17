
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://example.com/login'), // Reemplaza con tu URL de autenticación
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Aquí puedes manejar el éxito de la autenticación
      } else {
        // Manejo del error de autenticación
        _error = 'Invalid credentials';
      }
    } catch (e) {
      _error = 'An error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
