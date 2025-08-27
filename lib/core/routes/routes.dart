import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login  = '/login_screen';


  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name) {
      case splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
      return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            body: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              //  LottiefilesCommon(assetPath: AppLottieImages.pageNotFound, width: 200, height: 200),
                Text('Oops!. PAGE NOT FOUND')
              ],
            )),
          ),
        );
    }
  }
}