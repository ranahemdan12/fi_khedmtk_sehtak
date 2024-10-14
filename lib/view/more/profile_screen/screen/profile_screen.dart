import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/resources/strings_manger.dart';
import '../../../../../shared/statics/navigation_service.dart';
import '../../../../../shared/statics/reusable_component.dart';
import '../../../../../shared/statics/routes.dart';
import '../../../../../shared/statics/service_locator.dart';
import '../../../../models/request/auth/patch_profile/patch_profile_request.dart';
import '../../../../shared/statics/custom_validation.dart';
import '../cubit/patch_profile/patch_profile_cubit.dart';
import '../cubit/profile_cubit/profile_cubit.dart';
import '../widget/email_field.dart';
import '../widget/name_text_field.dart';
import '../widget/phone_field.dart';
import '../widget/profile_email_text.dart';
import '../widget/profile_name_text.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();



  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.profile.tr(),
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 34.h,),
              const ProfileNameText(),
              const ProfileEmailText(),
              SizedBox(height: 58.h,),
              BlocBuilder<ProfileCubit, ProfileState>(
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
              ),
            SizedBox(height: 18.h,),
              const EmailField(),
            SizedBox(height: 18.h,),
              const ProfilePhoneField(),
              SizedBox(height: 29.h,),
              BlocConsumer<PatchProfileCubit,PatchProfileState>(
                listener: (context,patchProfileState){
                  if (patchProfileState is PatchProfileSuccess){
                    showToast(patchProfileState.message);
                     ProfileCubit.get(context).updateName(patchProfileState.name);
                    sl<NavigationService>().pop();

                  } else if (patchProfileState is PatchProfileError){

                    return showToast( patchProfileState.message);
                  }
                },
                builder: (context,patchProfileState){
                if (patchProfileState is PatchProfileLoading) {
                return const Center(child: CustomLoadingIndicator());
              } else {
                  return CustomButton(text: StringManger.changeName.tr(),
                      onPressed: _changeName);
                }},

              ),
            SizedBox(height: 29.h,),
            CustomButton(text: StringManger.changePassword.tr(),
                onPressed: _changePassword ),
          ],),
        ),
      ),
    ));
  }




  void _changeName(){
    if (formKey.currentState!.validate()){
      PatchProfileCubit.get(context).patchProfile(
          request: PatchProfileRequest(
            user: PatchUser(firstName: nameController.text),
          ));

    }
    else{}

  }

  void _changePassword(){
    sl<NavigationService>().navigateTo(Routes.changePasswordScreen);
  }
}
