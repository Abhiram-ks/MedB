import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medb/core/constants/app_images.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.medbLogo,
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.25,
                  fit: BoxFit.contain,
                ),

                Text(
                  "Effortlessly schedule doctor appointments without waiting in queues. "
                  "Our user-friendly app ensures a hassle-free experience, putting you in control of your healthcare journey.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color:AppPalette.blackColor, 
                  ),
                ),

                ConstantWidgets.hight30(context),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                         AppPalette.blueColor,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    const Text(
                      "Loading...",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
