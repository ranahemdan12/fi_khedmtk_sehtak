import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/resources/strings_manger.dart';
import '../../../../../shared/statics/reusable_component.dart';
import '../../../../models/request/auth/change_password/change_password_request.dart';
import '../../../../shared/statics/password_field.dart';
import '../../../../shared/statics/service_locator.dart';
import '../cubit/change_password/change_password_cubit.dart';
import '../widget/change_pass_text.dart';
import '../widget/change_password_text.dart';
import '../widget/profile_email_text.dart';
import '../widget/profile_name_text.dart';

class ChangeCurrentPassword extends StatefulWidget {
  const ChangeCurrentPassword({Key? key}) : super(key: key);

  @override
  State<ChangeCurrentPassword> createState() => _ChangeCurrentPasswordState();
}

class _ChangeCurrentPasswordState extends State<ChangeCurrentPassword> {
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FocusNode currentPasswordFocusNode = FocusNode();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.profile.tr(),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 34.h),
                  const ProfileNameText(),
                  const ProfileEmailText(),
                  SizedBox(height: 54.h,),
                  const ChangePasswordText(),
                  ProfileChangePasswordText(
                    text: StringManger.currentPassword.tr(),
                  ),
                  PasswordField(
                    hintText: StringManger.currentPassword.tr(),
                    controller: currentPassController,
                    onEditComplete: () {
                      currentPasswordFocusNode.unfocus();
                      newPasswordFocusNode.requestFocus();
                    },
                  ),
                  ProfileChangePasswordText(
                    text: StringManger.newPassword.tr(),
                  ),
                  PasswordField(
                    hintText: StringManger.newPassword.tr(),
                    controller: newPassController,
                    passwordFocusNode: newPasswordFocusNode,
                    onEditComplete: () {
                      newPasswordFocusNode.unfocus();
                      confirmPasswordFocusNode.requestFocus();
                    },
                  ),
                  ProfileChangePasswordText(
                      text: StringManger.confirmNewPassword.tr()),
                  PasswordField(
                    hintText: StringManger.confirmNewPassword.tr(),
                    controller: confirmPassController,
                    passwordFocusNode: confirmPasswordFocusNode,
                    onEditComplete: () {
                      confirmPasswordFocusNode.unfocus();
                    },
                  ),
                  SizedBox(height: 64.h,),
                  BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                    listener: (BuildContext context,
                        ChangePasswordState changePasswordState) {
                      if (changePasswordState is ChangePasswordSuccess) {
                        sl<NavigationService>().pop();
                        showToast(StringManger.changePasswordSuccessful.tr());
                      } else if (changePasswordState is ChangePasswordError) {
                        showToast(StringManger.changePasswordFailed.tr());
                      }
                    },
                    builder: (BuildContext context, changePasswordState) {
                      if (changePasswordState is ChangePasswordLoading) {
                        return const Center(child: CustomLoadingIndicator());
                      }
                      return CustomButton(
                          text: StringManger.changePassword.tr(),
                          onPressed: (){
                            if (formKey.currentState!.validate()){
                            ChangePasswordCubit.get(context).changePassword(
                                 request: ChangePasswordRequest(
                                    oldPassword: currentPassController.text,
                                   newPassword: newPassController.text,
                                  confirmPassword: confirmPassController.text,
                               ));


                    }},
                  );})
                ],
              ),
            ),
          ),
        ));
  }


}
