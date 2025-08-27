import 'package:flutter/material.dart';
import '../../widgets/login_widget/login_body_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: GestureDetector(  
               onTap: () => FocusScope.of(context).unfocus(),
              child: LoginScreenBody(screenWidth: screenWidth,screenHeight: screenHeight))),
        );
      },
    );
  }
}
