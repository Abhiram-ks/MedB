import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/constants/app_images.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:medb/features/dashbord/data/repositories/logout_repository_impl.dart';
import 'package:medb/features/dashbord/presentation/state/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:medb/features/dashbord/presentation/state/bloc/logout_bloc/logout_bloc_bloc.dart';
import 'package:medb/features/dashbord/presentation/widgets/dashbord_widgets/dashbord_appbar_widget.dart';
import 'package:medb/features/dashbord/presentation/widgets/dashbord_widgets/dashbord_drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create:(context) => LogoutBlocBloc(LogoutRepositoryImpl(ApiService()))),
        BlocProvider(create: (context) => MenuCubit()..loadMenuData()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenHight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            drawer: AppDrawer(
              screenWidth: screenWidth,
              screenHight: screenHight,
            ),
            appBar: CustomAppBarDashbord(notificationCount: 2),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.medbLogo,
                        height: screenHight * 0.1,
                        fit: BoxFit.contain,
                      ),
                      ConstantWidgets.hight30(context),

                      Text(
                        "Welcome to MedB!",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppPalette.blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ConstantWidgets.hight10(context),

                      Text(
                        "We're glad to have you here. MedB is your trusted "
                        "platform for healthcare needs — all in one place.\n\n"
                        "Use the menu on the left to get started.",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppPalette.blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

