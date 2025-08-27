
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/themes/colors.dart';
import 'login_credential_widget.dart';
import 'login_register_widget.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.screenWidth, required this.screenHeight,
    
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(
            AppImages.cirleShade,
            width: screenWidth,
            fit: BoxFit.cover,
            repeat: true,
          ),
        ),
        Center(
          child: Container(
            width: screenWidth * 0.87,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppPalette.whiteColor.withAlpha(
                (0.87 * 255).round(),
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppPalette.blackColor.withAlpha(
                    (0.1 * 255).round(),
                  ),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoginCredentialPart(screenWidth: screenWidth),
                  RegistractionPart(screenHeight: screenHeight, screenWidth: screenWidth,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
