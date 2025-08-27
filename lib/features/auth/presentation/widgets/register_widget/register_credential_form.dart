import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/common/custom_button.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/presentation/widgets/register_widget/register_state_handle.dart';

import '../../../../../core/common/custom_snackbar.dart';
import '../../../../../core/common/custom_textedit.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/validation/input_validation.dart';
import '../../state/bloc/register_bloc/register_bloc_bloc.dart';

class RegisterCredentialForm extends StatefulWidget {
  const RegisterCredentialForm({super.key});

  @override
  State<RegisterCredentialForm> createState() => _RegisterCredentialFormState();
}

class _RegisterCredentialFormState extends State<RegisterCredentialForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextedit(
            hintText: 'Email Id',
            label: 'Email Id*',
            prefixIcon: CupertinoIcons.mail,
            controller: _emailController,
            validate: ValidatorHelper.emailValidation,
          ),
          ConstantWidgets.hight10(context),
          CustomTextedit(
            hintText: 'Password',
            label: 'Password*',
            prefixIcon: CupertinoIcons.padlock,
            controller: _passwordController,
            validate: ValidatorHelper.passwordValidation,
            isPassword: true,
          ),
          ConstantWidgets.hight10(context),
          CustomTextedit(
            isPassword: true,
            hintText: 'Confirm Password',
            label: 'Confirm Password*',
            prefixIcon: CupertinoIcons.padlock,
            controller: _confirmPasswordController,
            validate: (val) => ValidatorHelper.validatePasswordMatch(_passwordController.text.trim(), val),
          ),
          ConstantWidgets.hight50(context),
          BlocListener<RegisterBlocBloc, RegisterBlocState>(
            listener: (context, state) {
              registerStateHandle(context, state);
            },
            child: CustomButton(
              text: 'Create an Account',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<RegisterBlocBloc>().add(
                    RegisterCredentialFormEvent(
                      emailID: _emailController.text.trim(), 
                      password: _passwordController.text.trim()
                    ),
                  );
                } else {
                  CustomSnackBar.show(
                    context,
                    message:'Please fill in all the required credentials before proceeding to the next step.',
                    backgroundColor: AppPalette.redColor,
                  );
                }
              },
            ),
          ),
          ConstantWidgets.hight20(context),
        ],
      ),
    );
  }
}
