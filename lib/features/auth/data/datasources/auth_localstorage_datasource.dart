import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medb/features/auth/data/models/menu_item_model.dart';
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

  static const String _accessTokenKey = 'access_token';
  static const String _loginKeyKey = 'login_key';
  static const String _userDetailsKey = 'user_details';
  static const String _menuDataKey = 'menu_data'; 
  static const String _isLoggedInKey = 'is_logged_in';

  static String? _accessToken;
  static String? _loginKey;
  static UserDetailsModel? _userDetails;
  static List<MenuModule>? _menuData; 
  static bool _isLoggedIn = false;

  static Future<void> init() async {
    await _loadPersistedData();
  }

  static Future<void> storeLoginData(LoginResponseModel loginResponse) async {
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
        _storage.write(key: _accessTokenKey, value: loginResponse.accessToken),
        _storage.write(key: _loginKeyKey, value: loginResponse.loginKey),
        _storage.write(key: _userDetailsKey, value: jsonEncode(loginResponse.userDetails.toJson())),
        _storage.write(key: _menuDataKey, value: menuDataJson), 
        _storage.write(key: _isLoggedInKey, value: 'true'),
      ]);

      log('AuthService: Login data stored successfully');
    } catch (e) {
      log('AuthService: Error storing login data: $e');
      throw Exception('Failed to store login data');
    }
  }

  
  static String? get accessToken => _accessToken;
  static String? get loginKey => _loginKey;
  static UserDetailsModel? get userDetails => _userDetails;
  static List<MenuModule>? get menuData => _menuData;
  static bool get isLoggedIn => _isLoggedIn && _accessToken != null;

  static Future<void> clearLoginData() async {
    try {
      _accessToken = null;
      _loginKey = null;
      _userDetails = null;
      _menuData = null; 
      _isLoggedIn = false;

      await Future.wait([
        _storage.delete(key: _accessTokenKey),
        _storage.delete(key: _loginKeyKey),
        _storage.delete(key: _userDetailsKey),
        _storage.delete(key: _menuDataKey), 
        _storage.delete(key: _isLoggedInKey),
      ]);

    } catch (_) {
    }
  }

  static Future<void> updateAccessToken(String newAccessToken) async {
    try {
      _accessToken = newAccessToken;
      await _storage.write(key: _accessTokenKey, value: newAccessToken);
     
    } catch (_) {
    }
  }

  static Future<void> updateMenuData(List<MenuModule> menuData) async {
    try {
      _menuData = menuData;
      
      String menuDataJson = jsonEncode(
        menuData.map((module) => module.toJson()).toList()
      );
      
      await _storage.write(key: _menuDataKey, value: menuDataJson);
      print('AuthService: Menu data updated successfully');
    } catch (e) {
      print('AuthService: Error updating menu data: $e');
    }
  }

  static Future<void> _loadPersistedData() async {
    try {
      final isLoggedIn = await _storage.read(key: _isLoggedInKey);
      
      if (isLoggedIn == 'true') {
        final accessToken = await _storage.read(key: _accessTokenKey);
        final loginKey = await _storage.read(key: _loginKeyKey);
        final userDetailsStr = await _storage.read(key: _userDetailsKey);
        final menuDataStr = await _storage.read(key: _menuDataKey); 

        if (accessToken != null && loginKey != null) {
          _accessToken = accessToken;
          _loginKey = loginKey;
          _isLoggedIn = true;

          if (userDetailsStr != null) {
            try {
              final userDetailsJson = jsonDecode(userDetailsStr);
              _userDetails = UserDetailsModel.fromJson(userDetailsJson);
            } catch (e) {
              print('Error decoding user details: $e');
            }
          }

          if (menuDataStr != null) {
            try {
              final menuDataJson = jsonDecode(menuDataStr) as List;
              _menuData = menuDataJson
                  .map((moduleJson) => MenuModule.fromJson(moduleJson))
                  .toList();
              print('AuthService: Menu data loaded successfully - ${_menuData?.length} modules');
            } catch (e) {
              print('Error decoding menu data: $e');
              _menuData = null;
            }
          }

        }
      }
    } catch (e) {
      await clearLoginData();
    }
  }

  static List<MenuModule> get sortedModules {
    if (_menuData == null) return [];
    
    final sorted = List<MenuModule>.from(_menuData!);
    sorted.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    
    for (var module in sorted) {
      module.menus.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    }
    
    return sorted;
  }




  static List<MenuItemModel> get allMenuItems {
    if (_menuData == null) return [];
    
    List<MenuItemModel> allMenus = [];
    for (var module in _menuData!) {
      allMenus.addAll(module.menus);
    }
    
    allMenus.sort((a, b) {
      final moduleA = _menuData!.firstWhere((m) => m.menus.contains(a));
      final moduleB = _menuData!.firstWhere((m) => m.menus.contains(b));
      
      final moduleCompare = moduleA.sortOrder.compareTo(moduleB.sortOrder);
      if (moduleCompare != 0) return moduleCompare;
      
      return a.sortOrder.compareTo(b.sortOrder);
    });
    
    return allMenus;
  }

  static bool get hasMenuData => _menuData != null && _menuData!.isNotEmpty;
  
  static int get menuModuleCount => _menuData?.length ?? 0;
}