
import 'package:flutter/material.dart';
import '../../../../../core/common/custom_appbar.dart';
import '../../widgets/register_widget/register_details_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
    
        return Scaffold(
          appBar: const CustomAppBar(),
          body: RegisterDetailsBody(screenWidth: screenWidth, screenHeight: screenHeight,),
        );
      },
    );
  }
}
