
import 'package:flutter/material.dart';
import 'package:medb/core/routes/routes.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/themes/colors.dart';


class RegistractionPart extends StatelessWidget {
  const RegistractionPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
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
              backgroundColor: AppPalette.whiteColor
                  .withAlpha((0.87 * 255).round()),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: AppPalette.buttonColor,
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              'OTP Login?  Click here',
              style: TextStyle(
                fontSize: 16,
                color: AppPalette.buttonColor,
              ),
            ),
          ),
        ),
        ConstantWidgets.hight20(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account? "),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
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
    );
  }
}
