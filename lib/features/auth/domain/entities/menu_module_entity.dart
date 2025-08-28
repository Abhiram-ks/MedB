import 'menu_item_entity.dart';

class MenuModuleEntity {
  final int moduleId;
  final String moduleName;
  final int sortOrder;
  final String? moduleIcon;
  final List<MenuItemEntity> menus;

  MenuModuleEntity({
    required this.moduleId,
    required this.moduleName,
    required this.sortOrder,
    this.moduleIcon,
    required this.menus,
  });
}
