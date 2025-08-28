import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/dashbord/presentation/state/logout_bloc/logout_bloc_bloc.dart';
import 'package:medb/features/dashbord/presentation/widgets/dashbord_widgets/dashbord_drawer_builder.dart';
import 'package:medb/features/dashbord/presentation/widgets/dashbord_widgets/dashbord_logout_state_handle.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/constant.dart';

class AppDrawer extends StatelessWidget {
  final double screenWidth;
  final double screenHight;

  const AppDrawer({
    super.key,
    required this.screenWidth,
    required this.screenHight,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEAF4F4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Colors.white,
      width: screenWidth * .7,
      child: SafeArea(
        child: Column(
          children: [
            ConstantWidgets.hight30(context),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Image.asset(
                  AppImages.medbLogo,
                  height: screenHight * 0.06,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ConstantWidgets.hight20(context),
            Expanded(
              child: DrawerBuilder(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: BlocListener<LogoutBlocBloc, LogoutBlocState>(
                      listener: (context, state) {
                        logoutStateHandle(context, state);
                      },
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: AppPalette.redColor,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(color: AppPalette.redColor),
                        ),
                        onTap: () {
                          context.read<LogoutBlocBloc>().add(LogoutRequsted());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(
                        color: AppPalette.greyColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
