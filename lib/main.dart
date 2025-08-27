import 'package:flutter/material.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/core/themes/themes_management.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  //! Initialize Flutter engine before using plugins or async code

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}