import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
                   mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                'Page Not Found',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,       
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'The page you were looking for could not be found. '
                'It might have been removed, renamed, or does not exist.',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
          ],
        ),
      )
    );
  }
}