import 'menu_item_entity.dart';

class MenuModelEntity {
  final int moduleId;
  final String moduleName;
  final int sortOrder;
  final String? moduleIcon;
  final List<MenuItemEntity> menus;

  MenuModelEntity({
    required this.moduleId,
    required this.moduleName,
    required this.sortOrder,
    this.moduleIcon,
    required this.menus,
  });
}
