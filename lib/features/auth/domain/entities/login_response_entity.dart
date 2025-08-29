import 'package:medb/features/auth/data/models/menu_module_model.dart';
import 'package:medb/features/auth/data/models/user_details_model.dart';
class LoginResponseEntity {
  final String accessToken;
  final String loginKey;
  final UserModel userDetails;
  final List<MenuModel> menuData;


  LoginResponseEntity({
    required this.accessToken,
    required this.loginKey,
    required this.userDetails,
    required this.menuData,
  });
}
