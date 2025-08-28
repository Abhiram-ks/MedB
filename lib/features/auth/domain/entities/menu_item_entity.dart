class MenuItemEntity {
  final int menuId;
  final String menuName;
  final int sortOrder;
  final String? menuIcon;
  final String? actionName;
  final String? controllerName;
  final Map<String, dynamic>? rights;

  MenuItemEntity({
    required this.menuId,
    required this.menuName,
    required this.sortOrder,
    this.menuIcon,
    this.actionName,
    this.controllerName,
    this.rights,
  });
}
