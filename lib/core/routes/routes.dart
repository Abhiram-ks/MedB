import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:medb/features/auth/presentation/pages/register_screen/register_credential_screen.dart';
import 'package:medb/features/auth/presentation/pages/register_screen/register_details_screen.dart';
import 'package:medb/features/dashbord/presentation/screens/dashbord_screen/dashbord_screen.dart';

import '../../features/auth/presentation/pages/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login_screen';
  static const String register = '/register_screen';
  static const String credentials = '/register_credential_screen';
  static const String dashbord = '/dashbord_screen.dart';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case credentials:
        return MaterialPageRoute(builder: (_) => const RegisterCredentialScreen());
      case dashbord:
        return MaterialPageRoute(builder: (_) =>  DashboardScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;

                  return Scaffold(
                    body: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .04,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Page Not Found',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                           ConstantWidgets.hight20(context),
                            Text(
                              'The page you were looking for could not be found. '
                              'It might have been removed, renamed, or does not exist.',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
        );
    }
  }
}
