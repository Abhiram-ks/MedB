import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:medb/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:medb/features/auth/presentation/state/bloc/login_bloc/login_bloc_bloc.dart';
import '../../widgets/login_widget/login_body_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBlocBloc(AuthRepositoryImpl(ApiService())),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: LoginScreenBody(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
