import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../widget/custom_login_text.dart';
import '../widget/main_login_text.dart';
import '../widget/signup_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
               child: Center(
                 child:  Stack(
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
                                     height: 168.h,
                                   ),
                                   Center(child: MainLoginText()),
                                   SizedBox(
                                     height: 55.h,
                                   ),
                                   CustomLoginText(text: StringManger.phoneNumber),
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
                                   CustomLoginText(text: StringManger.password),
                                   SizedBox(
                                     height: 8.h,
                                   ),
                                   CustomTextFormField(
                                       validate: validatePassword,
                                       keyboardType: TextInputType.phone,
                                       textEditingController: passwordController,
                                       hintText: StringManger.password),
                                   SizedBox(
                                     height: 16.h,
                                   ),
                                   GestureDetector(
                                     onTap: () {},
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         Text(
                                           StringManger.forgetPassword,
                                           style: GoogleFonts.montserrat(
                                             fontSize: 14.sp,
                                             fontWeight: FontWeight.w500,
                                             color: ColorManger.blueColor,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                   SizedBox(
                                     height: 16.h,
                                   ),
                                   CustomButton(
                                       text: StringManger.login,
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
                                       Text(
                                         StringManger.donothaveAccount,
                                         style: GoogleFonts.montserrat(
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: ColorManger.blackColor,
                                         ),
                                       ),
                                       SignUpText(),
                                     ],
                                   ),
                                 ]),
                           ),
                         ),
                       ),

                       Positioned(
                         bottom: 0.h,
                         top: 785.h,
                         child: Image.asset(AssetManger.loginLogo),
                       ),
                     ],
                   ),
                 ),
             ),
          
                     );
  }
}
