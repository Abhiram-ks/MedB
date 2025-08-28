import 'package:flutter/material.dart';
import 'package:medb/core/constants/app_images.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          drawer: AppDrawer(screenWidth: screenWidth, screenHight: screenHight),
          appBar: CustomAppBarDashbord(
            notificationCount: 2,
            profileImageUrl: 'https://i.pravatar.cc/150?img=3',
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.medbLogo,
                      height: screenHight * 0.1,
                      fit: BoxFit.contain,
                    ),
                    ConstantWidgets.hight30(context),

                    Text(
                      "Welcome to MedB!",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppPalette.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ConstantWidgets.hight10(context),

                    Text(
                      "We're glad to have you here. MedB is your trusted "
                      "platform for healthcare needs — all in one place.\n\n"
                      "Use the menu on the left to get started.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppPalette.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AppDrawer extends StatelessWidget {
  final double screenWidth;
  final double screenHight;
  const AppDrawer({
    super.key,
    required this.screenWidth,
    required this.screenHight,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEAF4F4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Colors.white,
      width: screenWidth * .7,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                child: Center(
                  child: Image.asset(
                    AppImages.medbLogo,
                    height: screenHight * 0.06,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarDashbord extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final int notificationCount;
  final String profileImageUrl;
  final VoidCallback? onBack;
  final VoidCallback? onNotificationTap;

  @override
  final Size preferredSize;

  const CustomAppBarDashbord({
    super.key,
    this.title = 'Dashboard',
    this.notificationCount = 4,
    this.profileImageUrl = 'https://i.pravatar.cc/150?img=3',
    this.onBack,
    this.onNotificationTap,
  }) : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFEAF4F4),
      elevation: 4,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppPalette.blackColor,
        ),
      ),
      leading:
          onBack != null
              ? IconButton.filled(
                tooltip: 'Back',
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                ),
              )
              : null,
      actions: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppPalette.whiteColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: AppPalette.blackColor,
                ),
                onPressed: onNotificationTap ?? () {},
              ),
            ),
            if (notificationCount > 0)
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppPalette.redColor,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Center(
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(
                        color: AppPalette.whiteColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
          ),
        ),
      ],
    );
  }
}
