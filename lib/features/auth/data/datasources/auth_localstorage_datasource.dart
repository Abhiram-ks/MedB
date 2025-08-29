import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medb/features/auth/data/models/menu_module_model.dart';
import 'package:medb/features/auth/data/models/user_details_model.dart';
import '../models/login_response_model.dart';

class AuthService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _isAccessToken = 'access_token';
  static const String _isLoginKey = 'login_key';
  static const String _isUserDetails = 'user_details';
  static const String _isMenuData = 'menu_data'; 
  static const String _isLoged = 'is_loged';

  static String? _accessToken;
  static String? _loginKey;
  static UserModel? _userDetails;
  static List<MenuModel>? _menuData; 
  static bool _isLoggedIn = false;

  static Future<void> init() async {
    await _restoreSaveDatas();
  }

  static Future<void> storeLoginCredentials(LoginResponseModel loginResponse) async {
    try {
      _accessToken = loginResponse.accessToken;
      _loginKey = loginResponse.loginKey;
      _userDetails = loginResponse.userDetails;
      _menuData = loginResponse.menuData; 
      _isLoggedIn = true;

      String menuDataJson = jsonEncode(
        loginResponse.menuData.map((module) => module.toJson()).toList()
      );

      await Future.wait([
        _storage.write(key: _isAccessToken, value: loginResponse.accessToken),
        _storage.write(key: _isLoginKey, value: loginResponse.loginKey),
        _storage.write(key: _isUserDetails, value: jsonEncode(loginResponse.userDetails.toJson())),
        _storage.write(key: _isMenuData, value: menuDataJson), 
        _storage.write(key: _isLoged, value: 'true'),
      ]);

    } catch (e) {
      throw Exception('Failed to store login data');
    }
  }

  
  static String? get accessToken => _accessToken;
  static String? get loginKey => _loginKey;
  static UserModel? get userDetails => _userDetails;
  static List<MenuModel>? get menuData => _menuData;
  static bool get isLoggedIn => _isLoggedIn && _accessToken != null;

  static Future<void> clearLoginCredentials() async {
    try {
      _accessToken = null;
      _loginKey = null;
      _userDetails = null;
      _menuData = null; 
      _isLoggedIn = false;

      await Future.wait([
        _storage.delete(key: _isAccessToken),
        _storage.delete(key: _isLoginKey),
        _storage.delete(key: _isUserDetails),
        _storage.delete(key: _isMenuData), 
        _storage.delete(key: _isLoged),
      ]);

    } catch (e) {
      throw Exception('Failed : $e');
    }
  }

  static Future<void> _restoreSaveDatas() async {
    try {
      final isLoggedIn = await _storage.read(key: _isLoged);
      
      if (isLoggedIn == 'true') {
        final accessToken = await _storage.read(key: _isAccessToken);
        final loginKey = await _storage.read(key: _isLoginKey);
        final userDetailsStr = await _storage.read(key: _isUserDetails);
        final menuDataValue = await _storage.read(key: _isMenuData); 

        if (accessToken != null && loginKey != null) {
          _accessToken = accessToken;
          _loginKey = loginKey;
          _isLoggedIn = true;

          if (userDetailsStr != null) {
            try {
              final userDetailsJson = jsonDecode(userDetailsStr);
              _userDetails = UserModel.fromJson(userDetailsJson);
            } catch (e) {
             throw Exception('Failed : $e');
            }
          }

          if (menuDataValue != null) {
            try {
              final menuDataJson = jsonDecode(menuDataValue) as List;
              _menuData = menuDataJson
                  .map((moduleJson) => MenuModel.fromJson(moduleJson))
                  .toList();
            } catch (e) {
              _menuData = null;
            }
          }

        }
      }
    } catch (e) {
      await clearLoginCredentials();
    }
  }

  static List<MenuModel> get sortedModules {
    if (_menuData == null) return [];
    
    final sorted = List<MenuModel>.from(_menuData!);
    sorted.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    
    for (var module in sorted) {
      module.menus.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    }
    
    return sorted;
  }

  static bool get hasMenuData => _menuData != null && _menuData!.isNotEmpty;
  
}