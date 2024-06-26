import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



import '../../../shared/resources/asset_manger.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../widget/custom_sign_text.dart';
import '../widget/join_text.dart';
import '../widget/login_text.dart';
import '../widget/main_sign_text.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return StringManger.required;
    } else {
      return null;
    }
  }
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return StringManger.required;
    } else if (value.length < 6) {
      return StringManger.passwordShort;
    } else {
      return null;
    }
  }


  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                    SizedBox(
                      height: 90.h,
                    ),
                    Center(child: MainSignUpText()),
                    SizedBox(
                      height: 55.h,
                    ),
                    CustomSignupText(text: StringManger.fullName),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return StringManger.required;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textEditingController: fullNameController,
                        hintText: StringManger.fullName),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomSignupText(text: StringManger.email),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return StringManger.required;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textEditingController: emailController,
                        hintText: StringManger.email),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomSignupText(text: StringManger.phoneNumber),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return StringManger.required;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        textEditingController: phoneController,
                        hintText: StringManger.phone),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomSignupText(text: StringManger.password),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return StringManger.required;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        textEditingController: passwordController,
                        hintText: StringManger.password),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomButton(
                        text: StringManger.signUp,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.mainScreen,
                          );
                        }),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       JoinText(),
                      SizedBox(
                        height: 70.h,
                      ),
                      Center(child: MainSignUpText()),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomSignupText(text: StringManger.fullName),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextFormField(
                          validate: validateName,
                          keyboardType: TextInputType.text,
                          textEditingController: fullNameController,
                          hintText: StringManger.fullName),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      CustomSignupText(text: StringManger.email),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextFormField(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return StringManger.required;
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          textEditingController: emailController,
                          hintText: StringManger.email),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      CustomSignupText(text: StringManger.phoneNumber),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextFormField(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return StringManger.required;
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          textEditingController: phoneController,
                          hintText: StringManger.phone),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      CustomSignupText(text: StringManger.password),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                          validate: validatePassword,
                          keyboardType: TextInputType.phone,
                          textEditingController: passwordController,
                          hintText: StringManger.password),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomButton(
                          text: StringManger.signUp,
                          onPressed: () {
                      if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(
                              context,
                              Routes.mainScreen,
                            );}else null ;
                          }),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         JoinText(),

                         LoginText(),
                        ],
                      ),
                    ]),
                    Positioned(
                      bottom: 0.h,
                      top: 785.h,

                      child: SvgPicture.asset(AssetManger.loginLogo),
                    ),
                  ]),
                ),
              ),

              )],
          ),
        ),
      ),
    );
  }
}
