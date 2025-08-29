import 'package:flutter/material.dart';
import 'package:medb/core/constants/app_images.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/data/models/user_details_model.dart';

class ProfileScreenBody extends StatelessWidget {
  final double screenWidth;
  final double screenHight;
  final UserModel user;

  const ProfileScreenBody({
    super.key,
    required this.screenWidth,
    required this.screenHight,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    CircleAvatar(
      radius: 30,
      backgroundImage: user.profilePicture != null
          ? NetworkImage(user.profilePicture!)
          : const AssetImage(AppImages.medbLogo) as ImageProvider,
    ),
    ConstantWidgets.width20(context),
    Expanded( 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user.firstName} ${user.middleName} ${user.lastName}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1, 
            overflow: TextOverflow.ellipsis, 
          ),
          Row(
            children: [
              const Icon(Icons.verified, color: AppPalette.blueColor),
              ConstantWidgets.width20(context),
              Expanded( 
                child: Text(
                  user.email,
                  style: const TextStyle(color: AppPalette.greyColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
),

        ConstantWidgets.hight20(context),
        _infoTile("Contact Number", user.contactNo),
        _infoTile("Address", user.address ?? "No response"),
        _infoTile("Age", user.age?.toString() ?? "No response"),
        _infoTile("Gender", user.gender ?? "No response"),
        _infoTile("City", user.city ?? "No response"),
        _infoTile("District", user.district ?? "No response"),
        _infoTile("State", user.state ?? "No response"),
        _infoTile("Country", user.country ?? "No response"),
        _infoTile("Pin code", user.postalCode ?? "No response"),
      ],
    );
  }

  Widget _infoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppPalette.greyColor)),
        Text(value, style: const TextStyle(color: AppPalette.blackColor)),
        SizedBox(height: 10,)
      ],
    );
  }
}
