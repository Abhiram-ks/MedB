import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:medb/core/constants/app_images.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';

import '../../../../../core/common/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          resizeToAvoidBottomInset: false,
          body: Stack(
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
                  width: screenWidth * 0.86,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppPalette.whiteColor.withAlpha(
                      (0.87 * 255).round()),
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
                        Column(
                          children: [
  Image.asset(
                          AppImages.medbLogo,
                          width: screenWidth * 0.35,
                        ),
                        ConstantWidgets.hight10(context),

                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        ConstantWidgets.hight50(context),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        ConstantWidgets.hight10(context),

                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: const Icon(Icons.visibility_outlined),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        ConstantWidgets.hight10(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.lock_clock_outlined,
                                  size: 18,
                                  color: AppPalette.buttonColor,
                                ),
                              ],
                            ),
                            ConstantWidgets.width20(context),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppPalette.buttonColor,
                                ),
                              ),
                            ),
                          ],
                        ),

                        ConstantWidgets.hight30(context),
                        CustomButton(text: 'Login', onPressed: () {}),
                        ConstantWidgets.hight20(context),
                          ],
                        ),
                        Column(
                          children: [
                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Or"),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        ConstantWidgets.hight20(context),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  AppPalette.whiteColor.withAlpha(
                      (0.87 * 255).round() ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: AppPalette.buttonColor)
                                        
                              ),
                            ),
                            onPressed: (){},
                            child: Text(
                              'OTP Login?  Click here',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppPalette.buttonColor,
                              ),
                            ),
                          ),
                        ),ConstantWidgets.hight20(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ConstantWidgets.hight10(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Trouble logging in? "),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Click Here",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                          ],
                        )
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
