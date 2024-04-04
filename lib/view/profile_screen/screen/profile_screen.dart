import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../widget/profile_sub_title.dart';
import '../widget/profile_text_name.dart';



class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.profile, body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          SizedBox(height: 34.h,),
          ProfileText(),
          ProfileSubTitleText(),
          SizedBox(height: 58.h,),
          CustomTextField(text: StringManger.fullName, keyboardType:TextInputType.text, textEditingController: nameController, hintText: StringManger.fullName,),
          SizedBox(height: 18.h,),
          CustomTextField(text: StringManger.email, keyboardType: TextInputType.text, textEditingController: emailController, hintText: StringManger.email),
          SizedBox(height: 18.h,),
          CustomTextField(text: StringManger.phoneNumber, keyboardType: TextInputType.number, textEditingController: phoneController, hintText: StringManger.phoneNumber),
          SizedBox(height: 29.h,),
          CustomButton(text: StringManger.changePassword, onPressed: (){
            Navigator.pushNamed(context, Routes.changePasswordScreen);
          }),
        ],),
      ),
    ));
  }
}
