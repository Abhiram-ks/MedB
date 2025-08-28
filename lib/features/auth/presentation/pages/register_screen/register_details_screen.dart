
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:medb/features/auth/presentation/state/bloc/register_bloc/register_bloc_bloc.dart';
import '../../../../../core/common/custom_appbar.dart';
import '../../../data/datasources/register_remote_datasource.dart';
import '../../../data/repositories/register_repository_impl.dart';
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
