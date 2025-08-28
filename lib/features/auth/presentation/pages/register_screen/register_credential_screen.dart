
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medb/core/common/custom_appbar.dart';
import '../../../../../core/constants/constant.dart';
import '../../widgets/register_widget/register_credential_form.dart';

class RegisterCredentialScreen extends StatelessWidget {
  const RegisterCredentialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
    
        return Scaffold(
          appBar: const CustomAppBar(),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Join Us Today',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ConstantWidgets.hight10(context),
                      Text(
                        'Create your account and unlock a world of possibilities. Skip the wait. Schedule your doctor visits with ease.',
                      ),
                      ConstantWidgets.hight30(context),
                      RegisterCredentialForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
