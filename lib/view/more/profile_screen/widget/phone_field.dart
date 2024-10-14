import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/view/more/profile_screen/widget/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../cubit/profile_cubit/profile_cubit.dart';



class ProfilePhoneField extends StatefulWidget {
  const ProfilePhoneField({super.key});

  @override
  State<ProfilePhoneField> createState() => _ProfilePhoneFieldState();
}

class _ProfilePhoneFieldState extends State<ProfilePhoneField> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: state is ProfileSuccessState ? ProfileTextField(
              enabled: false,
              text: StringManger.phoneNumber.tr(),
              keyboardType:TextInputType.text,
              textEditingController: phoneController,
              hintText:"${state.profile.info!.phone} ")
              : const Text("Guest"),
        );
      },
    );
  }
}
