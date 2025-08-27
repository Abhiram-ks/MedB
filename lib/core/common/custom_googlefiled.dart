import 'package:flutter/material.dart';
import 'package:medb/core/constants/app_images.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';

class CustomGooglefiled {
  static Widget googleSignInModule(
      {required double screenWidth,
      required double screenHeight,
      required BuildContext context}) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.062,
      decoration: BoxDecoration(
          color:  AppPalette.whiteColor .withAlpha((0.87 * 255).round()),
          border: Border.all(color: AppPalette.hintColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: Colors.transparent,
        child:InkWell(
            onTap: () {},
            splashColor: AppPalette.hintColor.withAlpha(100),
            borderRadius: BorderRadius.circular(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.googleLogo,
                  height: screenHeight * 0.06,
                  fit: BoxFit.fill,
                ),ConstantWidgets.width20(context),
                Text(
                  "Sign Up with Google",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppPalette.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}