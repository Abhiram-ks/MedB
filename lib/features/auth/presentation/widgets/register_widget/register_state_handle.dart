import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/core/themes/colors.dart';

import '../../state/bloc/register_bloc/register_bloc_bloc.dart';

void registerStateHandle(BuildContext context, RegisterBlocState state) {
  if (state is RegisterGoToCredential) {
    Navigator.pushNamed(context, AppRoutes.credentials);
  } else if (state is RegisterConfirmationState) {
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text('Email Verification'),
            content: Text(
              'We’ve sent a verification link to ${state.emailId}. Please confirm your email before proceeding to the next step.'

            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Varify',
                  style: TextStyle(color: AppPalette.buttonColor),
                ),
                onPressed: () {
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text(
                  'Cancel',
                
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }
}
