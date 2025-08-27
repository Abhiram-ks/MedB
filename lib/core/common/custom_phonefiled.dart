import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/constants/constant.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/presentation/state/cubit/icon_cubit/icon_cubit_cubit.dart';

class CustomPhonefieldWidget {
  static Widget phoneNumberField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
    required BuildContext context,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    Color iconColor = const Color.fromARGB(255, 152, 152, 152),
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 5),
          child: Text(
            hintText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        BlocProvider(
          create: (context) => IconCubitCubit(),
          child: BlocSelector<IconCubitCubit, IconCubitState, PhoneFiledColorUpdated?>(
            selector: (state) {
              if (state is PhoneFiledColorUpdated) {
                return state;
              }
              return null;
            },
            builder: (context, state) {
              Color suffixColor = state?.color ?? iconColor;

              return TextFormField(
                controller: controller,
                validator: validator,
                obscureText: false,
                style: const TextStyle(fontSize: 16),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                enabled: enabled,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  context.read<IconCubitCubit>().updateIcon(value.length == 10);
                },
                decoration: InputDecoration(
                  hintText: label,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 152, 152, 152)),
                  prefixIcon: Icon(
                    prefixIcon,
                    color: const Color.fromARGB(255, 152, 152, 152),
                  ),
                  suffixIcon: Icon(Icons.check_circle, color: suffixColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppPalette.hintColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppPalette.buttonColor, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppPalette.redColor, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppPalette.redColor, width: 1),
                  ),
                ),
              );
            },
          ),
        ),
        ConstantWidgets.hight10(context),
      ],
    );
  }
}

