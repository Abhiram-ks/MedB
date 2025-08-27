import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/presentation/state/bloc/register_bloc/register_bloc_bloc.dart';
import 'package:medb/features/auth/presentation/widgets/register_widget/register_state_handle.dart';
import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_phonefiled.dart';
import '../../../../../core/common/custom_snackbar.dart';
import '../../../../../core/common/custom_textedit.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/validation/input_validation.dart';

class RegisterDetailsForm extends StatefulWidget {
  const RegisterDetailsForm({super.key});

  @override
  State<RegisterDetailsForm> createState() => _RegisterDetailsFormState();
}

class _RegisterDetailsFormState extends State<RegisterDetailsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextedit(
            hintText: 'Full Name',
            label: 'First Name*',
            prefixIcon: CupertinoIcons.person,
            controller: _firstNameController,
            validate: ValidatorHelper.nameValidation,
          ),
          ConstantWidgets.hight10(context),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomTextedit(
                  label: 'Middle Name',
                  controller: _middleNameController,
                ),
              ),
              ConstantWidgets.width20(context),
              Expanded(
                flex: 1,
                child: CustomTextedit(
                  label: 'Last Name',
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          ConstantWidgets.hight10(context),
          CustomPhonefieldWidget.phoneNumberField(
            hintText: 'Phone Number',
            label: 'Contact Number*',
            prefixIcon: CupertinoIcons.phone,
            controller: _phoneController,
            context: context,
            validator: ValidatorHelper.validatePhoneNumber,
          ),
          ConstantWidgets.hight50(context),
          BlocListener<RegisterBlocBloc, RegisterBlocState>(
            listener: (context, state) {
              registerStateHandle(context, state);
            },
            child: CustomButton(
              text: 'Verify Mobile Number',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<RegisterBlocBloc>().add(
                    RegisterDetailsFormEvent(
                      firstName: _firstNameController.text.trim(),
                      middleName: _middleNameController.text.trim(),
                      lastName: _lastNameController.text.trim(),
                      phoneNumber: _phoneController.text.trim(),
                    ),
                  );
                } else {
                  CustomSnackBar.show(
                    context,
                    message:
                        'Please fill in all the required credentials before proceeding to the next step.',
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
