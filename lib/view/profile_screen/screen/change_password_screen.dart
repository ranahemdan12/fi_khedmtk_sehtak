import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';


import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/change_pass_text.dart';
import '../widget/profile_sub_title.dart';
import '../widget/profile_text_name.dart';

class ChangeCurrentPassword extends StatelessWidget {
  ChangeCurrentPassword({Key? key}) : super(key: key);

  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.profile, body: Padding(
      padding:EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 34.h,),
            ProfileText(),
            ProfileSubTitleText(),
            SizedBox(height: 54.h,),
            ChangePasswordText(),
            SizedBox(height: 29.h,),
            CustomTextField(text: StringManger.currentPassword, keyboardType: TextInputType.text, textEditingController: currentPassController, hintText: StringManger.currentPassword),
            SizedBox(height: 29.h,),
            CustomTextField(text: StringManger.newPassword, keyboardType: TextInputType.text, textEditingController: newPassController, hintText: StringManger.newPassword),
            SizedBox(height: 29.h,),
            CustomTextField(text: StringManger.confirmNewPassword, keyboardType: TextInputType.text, textEditingController: confirmPassController, hintText: StringManger.confirmNewPassword),
            SizedBox(height: 64.h,),
            CustomButton(text: StringManger.changePassword, onPressed: (){
        
            }),
          ],
        ),
      ),
    ));
  }
}
