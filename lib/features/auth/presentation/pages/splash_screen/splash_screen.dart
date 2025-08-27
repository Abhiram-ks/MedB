import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/features/auth/presentation/state/bloc/splash_bloc/splash_bloc_bloc.dart';
import 'package:medb/features/auth/presentation/widgets/splash_widget/splash_body_widget.dart';
import 'package:medb/features/auth/presentation/widgets/splash_widget/splash_state_handle.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBlocBloc, SplashBlocState>(
      listener: (context, state) {
       splashStateHandle(context, state);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Scaffold(
            body: SplashScreenBody(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          );
        },
      ),
    );
  }
}
