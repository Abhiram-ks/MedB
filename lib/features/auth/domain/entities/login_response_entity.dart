import 'package:medb/features/auth/domain/entities/user_details_entitly.dart';

import 'menu_module_entity.dart';

class LoginResponseEntity {
  final String accessToken;
  final String loginKey;
  final UserDetailsEntity userDetails;
  final List<MenuModuleEntity> menuData;

  LoginResponseEntity({
    required this.accessToken,
    required this.loginKey,
    required this.userDetails,
    required this.menuData,
  });
}
