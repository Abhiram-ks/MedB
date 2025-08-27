import 'package:flutter/cupertino.dart';
import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_phonefiled.dart';
import '../../../../../core/common/custom_textedit.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/validation/input_validation.dart';

class RegisterDetailsForm extends StatelessWidget {
  const RegisterDetailsForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextedit(
          hintText: 'Full Name',
          label: 'First Name*',
          prefixIcon: CupertinoIcons.person,
          controller: TextEditingController(),
          validate: ValidatorHelper.nameValidation,
        ),
        ConstantWidgets.hight10(context),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomTextedit(
                label: 'Middle Name',
                controller: TextEditingController(),
                validate: ValidatorHelper.nameValidation,
              ),
            ),
            ConstantWidgets.width20(context),
            Expanded(
              flex: 1,
              child: CustomTextedit(
                label: 'Last Name',
                controller: TextEditingController(),
                validate: ValidatorHelper.nameValidation,
              ),
            ),
          ],
        ),
        ConstantWidgets.hight10(context),
        CustomPhonefieldWidget.phoneNumberField(
          hintText: 'Phone Number',
          label: 'Contact Number*',
          prefixIcon: CupertinoIcons.phone,
          controller: TextEditingController(),
          context: context,
          validator: ValidatorHelper.validatePhoneNumber,
        ),
        ConstantWidgets.hight50(context),
        CustomButton(
          text: 'Verify Mobile Number',
          onPressed: () {},
        ),
        ConstantWidgets.hight20(context),
      ],
    );
  }
}
