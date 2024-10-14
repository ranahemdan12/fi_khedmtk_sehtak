import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/constants.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/phone_field.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/request/auth/sign_up/signup_request.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/custom_validation.dart';
import '../../../../shared/statics/password_field.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../select_city_screen/cubit/city_cubit.dart';
import '../../otp_screen/cubit/otp_cubit.dart';
import '../../otp_screen/screen/otp_screen.dart';
import '../cubit/signup_cubit.dart';
import '../widget/city_dropdown.dart';
import '../widget/custom_sign_text.dart';
import '../widget/join_text.dart';
import '../widget/login_text.dart';
import '../widget/main_sign_text.dart';
import '../widget/region_dropdown.dart';




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode passwordFocusNode = FocusNode();
  String countryCode = Constants.egyptCountryCode;


  @override
  void initState() {
    CityCubit.get(context).getCity();
    super.initState();
  }


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
                fit: BoxFit.cover,),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        const Center(child: MainSignUpText()),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.fullName.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                            validate: CustomValidation.validateName,
                            keyboardType: TextInputType.text,
                            textEditingController: fullNameController,
                            hintText: StringManger.fullName.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.email.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                            validate: CustomValidation.validateEmail,
                            keyboardType: TextInputType.text,
                            textEditingController: emailController,
                            hintText: StringManger.email.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.phoneNumber.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        PhoneField(
                          onCountryChanged: (country) {
                            setState(() {
                              countryCode = country.dialCode;
                            });
                          },
                          controller: phoneController,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.password.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        PasswordField(
                          hintText: StringManger.password.tr(),
                          controller: passwordController,
                          passwordFocusNode: passwordFocusNode,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.city.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        const CityDropDown(),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.region.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        const DropDownRegion(),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomSignupText(text: StringManger.address.tr()),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomTextFormField(
                            validate: CustomValidation.validateName,
                            keyboardType: TextInputType.text,
                            textEditingController: addressController,
                            hintText: StringManger.address.tr()),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocConsumer<SignupCubit, SignupState>(
                          listener: (context, state) {
                            if (state is SignupSuccessState) {
                              OtpCubit.get(context).phone =
                                  '$countryCode${Utils.getCleansedPhoneNumber(phoneNumber: phoneController.text, countryCode: Constants.egyptCountryCode)}';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OtpScreen(),
                                  ));
                    
                            }
                            else if (state is SignupFailureState){
                              return showToast(state.message);
                            }
                          },
                          builder: (context, state) {
                            if (state is SignupLoading) {
                              return const Center(child: CustomLoadingIndicator());
                            } else {
                              return CustomButton(
                                  text: StringManger.signUp.tr(),
                                  onPressed: (){
                                    if (formKey.currentState!.validate()) {
                                      SignupCubit.get(context).signup(
                                          request: SignUpRequestModel(
                                            address:addressController.text ,
                                              user: UserModel(
                                                email: emailController.text,
                                                firstName:
                                                fullNameController.text,
                                                password:
                                                passwordController.text,
                                                phone:
                                                '$countryCode${Utils.getCleansedPhoneNumber(phoneNumber: phoneController.text, countryCode: Constants.egyptCountryCode)}',
                                              ),
                                              city:
                                              SignupCubit.get(context).city,
                                              region: SignupCubit.get(context)
                                                  .region));
                                    } else {}
                    
                                  } );
                            }
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            JoinText(),
                            LoginText(),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
        
        
        
          ]),
        ),
      ),
    );
  }

}
