
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/themes/colors.dart' show AppPalette;
import 'package:medb/features/auth/data/models/menu_module_model.dart';
import 'package:medb/features/dashbord/presentation/state/cubit/menu_cubit/menu_cubit_cubit.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, List<MenuModel>>(
      builder: (context, modules) {
        if (modules.isEmpty) {
          return const Center(child: Text("No menu available"));
        }
    
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: modules.length,
          itemBuilder: (context, moduleIndex) {
            final module = modules[moduleIndex];
            return ExpansionTile(
              childrenPadding: const EdgeInsets.only(
                left: 16,
                bottom: 8,
              ),
              shape: const Border(),
              collapsedShape: const Border(),
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
    
              leading:
                  module.moduleIcon != null
                      ? SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.network(
                          module.moduleIcon ??
                              'https://cdn4.iconfinder.com/data/icons/ui-beast-3/32/ui-49-4096.png',
                          fit: BoxFit.contain,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.folder_copy_outlined,
                                    color: AppPalette.buttonColor,
                                  ),
                        ),
                      )
                      : const Icon(Icons.folder),
              title: Text(
                module.moduleName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppPalette.blackColor,
                ),
              ),
              children:
                  module.menus.map((menu) {
                    return ListTile(
                      style: ListTileStyle.drawer,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      horizontalTitleGap: 12,
                      minLeadingWidth: 20,
                      minTileHeight: 40,
                      minVerticalPadding: 0,
                      leadingAndTrailingTextStyle: const TextStyle(
                        color: AppPalette.greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      titleTextStyle: const TextStyle(
                        color: AppPalette.greyColor,
                        fontSize: 14,
                      ),
    
                      leading:
                          menu.menuIcon != null
                              ? SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.network(
                                  menu.menuIcon ??
                                      'https://cdn4.iconfinder.com/data/icons/ui-beast-3/32/ui-49-4096.png',
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Icon(Icons.error),
                                ),
                              )
                              : const Icon(Icons.error),
                      title: Text(
                        menu.menuName,
                        style: TextStyle(color: AppPalette.greyColor),
                      ),
                      onTap: () {
                        debugPrint(
                          "Navigate to: ${menu.controllerName} (${menu.actionName})",
                        );
                      },
                    );
                  }).toList(),
            );
          },
        );
      },
    );
  }
}

