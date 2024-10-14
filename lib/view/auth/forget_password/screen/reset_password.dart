import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/navigation_service.dart';
import '../../../../shared/statics/password_field.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../signup_screen/widget/custom_sign_text.dart';
import '../cubit/forget_password_otp_cubit.dart';
import '../widget/reset_password.dart';



class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsetsDirectional.symmetric(horizontal: 26),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 189.h,
                    ),
                    Center(child: SvgPicture.asset(AssetManger.resetPass)),
                    SizedBox(
                      height: 21.h,
                    ),
                    const ResetPassText(),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomSignupText(text: StringManger.password.tr()),
                    SizedBox(
                      height: 8.h,
                    ),
                    PasswordField(
                      hintText: StringManger.password.tr(),
                      controller: passwordController,
                      passwordFocusNode: passwordFocusNode,
                      onChanged: (p0) {},
                      label: StringManger.confirmNewPassword,
                      onEditComplete: () {
                        passwordFocusNode.unfocus();
                        confirmPasswordFocusNode.requestFocus();
                      },

                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomSignupText(text: StringManger.confirmPassword.tr()),
                    SizedBox(
                      height: 8.h,
                    ),
                    PasswordField(
                       hintText: StringManger.confirmNewPassword.tr(),
                        controller: confirmPasswordController,
                        passwordFocusNode: confirmPasswordFocusNode,
                        onChanged: (p0) {},
                        label: StringManger.confirmNewPassword,
                        onEditComplete: () {
                          confirmPasswordFocusNode.unfocus();
                        },
                        // validator: (p0) {
                        //   if (p0!.isEmpty) {
                        //     return StringManger.required.tr();
                        //   } else if(p0 != passwordController.text){
                        //     return StringManger.unMatchedPass.tr();
                        //   }
                        //   else if (p0.length < 6) {
                        //     return StringManger.passwordShort.tr();
                        //   }
                        //
                        //   else {
                        //     return null;
                        //   }
                        // }
                        ),
                    SizedBox(
                      height: 24.h,
                    ),
                    BlocConsumer<ForgetPasswordOtpCubit,
                        ForgetPasswordOtpState>(
                      listener: (context, state) {
                        if (state is ResetPassSuccess) {
                          sl<NavigationService>().navigateTo(Routes.loginScreen);
                        }
                      },
                      builder: (context, state) {
                        if (state is ResetPassLoading) {
                          return const Center(child: CustomLoadingIndicator());
                        } else {
                          return CustomButton(
                              text: StringManger.submit.tr(),
                              onPressed: (){
                                if (formKey.currentState!.validate()) {
                                  ForgetPasswordOtpCubit.get(context)
                                      .resetPassword(
                                    password: passwordController.text,
                                  );
                                } else {}
                              } );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
