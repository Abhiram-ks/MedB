import 'package:flutter/material.dart';
import 'package:medb/features/auth/presentation/widgets/splash_widget/splash_body_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;

        return Scaffold(
          body: SplashScreenBody(screenWidth: screenWidth, screenHeight: screenHeight),
        );
      },
    );
  }
}

