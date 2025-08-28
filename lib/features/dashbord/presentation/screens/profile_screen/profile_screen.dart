import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/data/models/user_details_model.dart';
import 'package:medb/features/dashbord/presentation/state/cubit/user_cubit/user_cubit_cubit.dart';
import 'package:medb/features/dashbord/presentation/widgets/profile_widgets/profile_tail_widget.dart';

import '../../../../../core/common/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserDetailsCubit()..loadUserDetails(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHight = constraints.maxHeight;

          return Scaffold(
            appBar: const CustomAppBar(),
            body: BlocBuilder<UserDetailsCubit, UserDetailsModel?>(
              builder: (context, userDetails) {
                if (userDetails == null) {
                  return Center(child: Text(
                    'No user'
                  ),);
                }
                return SafeArea(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal details',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ConstantWidgets.hight10(context),
                            Text(
                              "Your details help us confirm your identity and keep our community safe and are secured with end-to-end encryption.",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            ConstantWidgets.hight30(context),
                            ProfileScreenBody(
                              screenWidth: screenWidth,
                              screenHight: screenHight,
                              user: userDetails,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: AppPalette.buttonColor,
                  heroTag: "edit_profile",
                  onPressed: () {},
                  child: const Icon(Icons.edit, color: AppPalette.whiteColor),
                ),
                ConstantWidgets.hight10(context),
                FloatingActionButton(
                  heroTag: "edit_phone",
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppPalette.buttonColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: AppPalette.buttonColor,
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.phone_android),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


