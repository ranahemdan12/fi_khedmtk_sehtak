import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../models/request/auth/forget_password/forget_pass_req_model.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/constants.dart';
import '../../../../shared/statics/navigation_service.dart';
import '../../../../shared/statics/phone_field.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../../../shared/statics/utils.dart';
import '../cubit/forget_password_otp_cubit.dart';
import '../../signup_screen/widget/custom_sign_text.dart';
import '../widget/forget_text.dart';



class FirstForgetScreen extends StatefulWidget {
  const FirstForgetScreen({super.key});

  @override
  State<FirstForgetScreen> createState() => _FirstForgetScreenState();
}

class _FirstForgetScreenState extends State<FirstForgetScreen> {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 201.h,
                ),
                const ForgetText(),
                SizedBox(
                  height: 88.h,
                ),
                Center(child: SvgPicture.asset(AssetManger.firstForget)),
                SizedBox(
                  height: 81.h,
                ),
                CustomSignupText(text: StringManger.phoneNumber.tr()),
                SizedBox(
                  height: 8.h,
                ),
                PhoneField(
                  onCountryChanged: (country) {},
                  controller: phoneController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<ForgetPasswordOtpCubit, ForgetPasswordOtpState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccess) {
                      sl<NavigationService>().navigateTo(Routes.forgetOtpScreen);
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgetPasswordLoading) {
                      return const Center(child: CustomLoadingIndicator());
                    } else {
                      return CustomButton(
                        text: StringManger.submit.tr(),
                        onPressed: (){
                          FocusScope.of(context).unfocus();

                          ForgetPasswordOtpCubit.get(context).forgetPassword(
                              request: ForgetPasswordReqModel(
                                phone:
                                '${Constants.egyptCountryCode}${Utils.getCleansedPhoneNumber(phoneNumber: phoneController.text, countryCode: Constants.egyptCountryCode)}',
                              ));
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }



}
