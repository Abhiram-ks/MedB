import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medb/core/common/custom_googlefiled.dart';
import 'package:medb/features/auth/presentation/widgets/register_widget/register_details_form.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/routes/routes.dart';

class RegisterDetailsBody extends StatelessWidget {
  const RegisterDetailsBody({super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an Account',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ConstantWidgets.hight10(context),
                Text(
                  'Please enter your details and verify your mobile number to complete the account registration process.',
                ),
                ConstantWidgets.hight30(context),
                RegisterDetailsForm(),
                CustomGooglefiled.googleSignInModule(context: context, screenHeight: screenHeight, screenWidth: screenWidth),
                ConstantWidgets.hight30(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

