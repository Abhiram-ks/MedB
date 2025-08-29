import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/data/models/menu_module_model.dart';
import 'package:medb/features/dashbord/presentation/state/cubit/menu_cubit/menu_cubit_cubit.dart';

class CustomAppBarDashbord extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final int notificationCount;
  final VoidCallback? onBack;
  final VoidCallback? onNotificationTap;

  @override
  final Size preferredSize;

  const CustomAppBarDashbord({
    super.key,
    this.title = 'Dashboard',
    this.notificationCount = 4,
    this.onBack,
    this.onNotificationTap,
  }) : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFEAF4F4),
      elevation: 4,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppPalette.blackColor,
        ),
      ),
      leading:
          onBack != null
              ? IconButton.filled(
                tooltip: 'Back',
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                ),
              )
              : null,
      actions: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppPalette.whiteColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: AppPalette.blackColor,
                ),
                onPressed: onNotificationTap ?? () {},
              ),
            ),
            if (notificationCount > 0)
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppPalette.redColor,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Center(
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(
                        color: AppPalette.whiteColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        BlocBuilder<MenuCubit, List<MenuModel>>(
          builder: (context, modules) {
            final String profileImageUrl =
                (modules.isNotEmpty && modules.first.moduleIcon != null)
                    ? modules.first.moduleIcon!
                    : 'https://cdn-icons-png.flaticon.com/512/9187/9187604.png';
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profile);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
