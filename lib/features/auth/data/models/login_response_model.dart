import 'user_details_model.dart';
import 'menu_module_model.dart';

class LoginResponseModel {
  final String accessToken;
  final String loginKey;
  final UserDetailsModel userDetails;
  final List<MenuModule> menuData;

  LoginResponseModel({
    required this.accessToken,
    required this.loginKey,
    required this.userDetails,
    required this.menuData,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] ?? '',
      loginKey: json['loginKey'] ?? '',
      userDetails: UserDetailsModel.fromJson(json['userDetails'] ?? {}),
      menuData: (json['menuData'] as List<dynamic>?)
          ?.map((item) => MenuModule.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'loginKey': loginKey,
      'userDetails': userDetails.toJson(),
      'menuData': menuData.map((module) => module.toJson()).toList(),
    };
  }
}