import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_snackbar.dart';
import '../../../../../core/common/custom_textedit.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/validation/input_validation.dart';

class LoginCredentialPart extends StatefulWidget {
  const LoginCredentialPart({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  State<LoginCredentialPart> createState() => _LoginCredentialPartState();
}

class _LoginCredentialPartState extends State<LoginCredentialPart> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(AppImages.medbLogo, width: widget.screenWidth * 0.35),
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
          CustomTextedit(
            label: 'Email',
            prefixIcon: CupertinoIcons.mail,
            controller: _emailController,
            validate: ValidatorHelper.emailValidation,
          ),
          ConstantWidgets.hight10(context),
          CustomTextedit(
            label: 'Password',
            prefixIcon: CupertinoIcons.padlock,
            controller: _passwordController,
            validate: ValidatorHelper.passwordValidation,
            isPassword: true,
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
          CustomButton(
            text: 'Login',
            onPressed: () {
            if (_formKey.currentState!.validate()) {
              
            }
             CustomSnackBar.show(context, message: 'Please fill in all the required credentials before proceeding to the next step.', backgroundColor: AppPalette.redColor);
            },
          ),
          ConstantWidgets.hight20(context),
        ],
      ),
    );
  }
}




