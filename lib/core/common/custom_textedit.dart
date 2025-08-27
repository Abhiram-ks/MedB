import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/presentation/state/cubit/icon_cubit/icon_cubit_cubit.dart';

class CustomTextedit extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String? value) validate;
  final bool isPassword;

  const CustomTextedit({
   super.key,
   required this.label,
   required this.hintText,
   required this.prefixIcon,
   required this.controller,
   required this.validate,
   this.isPassword = false,
   });

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<IconCubitCubit, IconCubitState, bool>(
          selector: (state) {
            if (state is PasswordVisibilityUpdated) {
              return state.isVisible; 
            }
            return false;
          },
          builder: (context, isVisible) {
            return TextFormField(
              controller:  controller,
              validator:  validate,
              obscureText: isPassword ? !isVisible : false,
              style: const TextStyle(fontSize: 16),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppPalette.hintColor),
                prefixIcon: Icon(
                  prefixIcon,
                  color: const Color.fromARGB(255, 52, 52, 52),
                ),
                suffixIcon: isPassword
                    ? GestureDetector(
                        onTap: () {
                          context.read<IconCubitCubit>().togglePasswordVisibility(isVisible);
                        },
                        child: Icon(
                             isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppPalette.hintColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppPalette.buttonColor, width: 1)),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppPalette.redColor,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppPalette.redColor,
                    width: 1,
                  ),
                )
              ),
            );
          },
        );
  }
}