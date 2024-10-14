import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/view/more/profile_screen/widget/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../cubit/profile_cubit/profile_cubit.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: state is ProfileSuccessState ? ProfileTextField(
              enabled: false,
              text: StringManger.email.tr(),
              keyboardType:TextInputType.text,
              textEditingController: emailController,
              hintText:"${state.profile.info!.email} ")
              : const Text("Guest"),
        );
      },
    );
  }
}
