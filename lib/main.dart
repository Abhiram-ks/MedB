import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/core/themes/themes_management.dart';
import 'package:medb/features/auth/presentation/state/bloc/splash_bloc/splash_bloc_bloc.dart';
import 'package:medb/features/auth/presentation/state/cubit/progresser_cubit/progresser_cubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //! Initialize Flutter engine before using plugins or async code

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBlocBloc()..add(SplashEventRequest()),
        ),
        BlocProvider(create: (context) => ProgresserCubitCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
