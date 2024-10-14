import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/custom_validation.dart';
import '../cubit/profile_cubit/profile_cubit.dart';
import 'name_text_field.dart';

class ProfileNameField extends StatefulWidget {
  const ProfileNameField({super.key});

  @override
  State<ProfileNameField> createState() => _ProfileNameFieldState();
}

class _ProfileNameFieldState extends State<ProfileNameField> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state is ProfileSuccessState ?
        NameTextField(
            validate: CustomValidation.validateName,
            enabled: true,
            text: StringManger.name.tr(),
            keyboardType:TextInputType.text,
            textEditingController: nameController,
            hintText:"${state.profile.info!.firstName} ")
            : const Text("Guest");
      },
    );
  }
}
