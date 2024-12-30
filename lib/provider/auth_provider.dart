import 'package:flutter/foundation.dart';
import '../services/storage_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userId;
  String? _fullName;

  bool get isAuthenticated => _isAuthenticated;
  String? get userId => _userId;
  String? get fullName => _fullName;

  Future<void> login(String email, String password) async {
    // Simulate authentication
    _isAuthenticated = true;
    _userId = email;
    _fullName = await StorageService.getString('full_name');
    await StorageService.setString('user_id', email);
    await StorageService.setBool('is_authenticated', true);
    notifyListeners();
  }

  Future<void> signup(String email, String password, String fullName) async {
    // Simulate user creation
    _isAuthenticated = true;
    _userId = email;
    _fullName = fullName;
    await StorageService.setString('user_id', email);
    await StorageService.setString('full_name', fullName);
    await StorageService.setBool('is_authenticated', true);
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userId = null;
    _fullName = null;
    await StorageService.remove('user_id');
    await StorageService.remove('full_name');
    await StorageService.remove('is_authenticated');
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    _isAuthenticated = await StorageService.getBool('is_authenticated') ?? false;
    _userId = await StorageService.getString('user_id');
    _fullName = await StorageService.getString('full_name');
    notifyListeners();
  }
}
