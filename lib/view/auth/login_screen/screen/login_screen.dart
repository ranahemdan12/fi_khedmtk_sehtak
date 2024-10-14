import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/password_field.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/request/auth/login/login_request.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/constants.dart';
import '../../../../shared/statics/phone_field.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../login_cubit/login_cubit.dart';
import '../widget/custom_login_text.dart';
import '../widget/dont_have_text.dart';
import '../widget/main_login_text.dart';
import '../widget/signup_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String countryCode = Constants.egyptCountryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  AssetManger.loginLogo,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 26),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 168.h,
                          ),
                          const Center(child: MainLoginText()),
                          SizedBox(
                            height: 55.h,
                          ),
                          CustomLoginText(text: StringManger.phoneNumber.tr()),
                          SizedBox(
                            height: 8.h,
                          ),
                          PhoneField(
                            controller: phoneController,
                            onCountryChanged: (value) {
                              setState(() {
                                countryCode = value.dialCode;
                              });
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomLoginText(text: StringManger.password.tr()),
                          SizedBox(
                            height: 8.h,
                          ),
                          PasswordField(
                              controller: passwordController,
                              passwordFocusNode: passwordFocusNode,
                              hintText: StringManger.password.tr()),
                          SizedBox(
                            height: 16.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              sl<NavigationService>()
                                  .navigateTo(Routes.firstForgetScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    StringManger.forgetPassword.tr(),

                                    style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blueColor)
                                )

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                sl<NavigationService>()
                                    .navigatePushNamedAndRemoveUntil(
                                        Routes.splashScreen);
                              } else if (state is LoginErrorState) {
                                return showToast(state.message);
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return const CustomLoadingIndicator();
                              } else {
                                return CustomButton(
                                    text: StringManger.login.tr(),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        LoginCubit.get(context).login(
                                            loginRequestModel:
                                                LoginRequestModel(
                                          phoneNumber:
                                              '$countryCode${Utils.getCleansedPhoneNumber(phoneNumber: phoneController.text, countryCode: countryCode)}',
                                          password: passwordController.text,
                                        ));
                                      }
                                    });
                              }
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const DontHaveText(),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
