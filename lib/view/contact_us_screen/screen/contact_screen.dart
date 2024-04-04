
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/customText.dart';
import '../widget/message_text_field.dart';
import '../widget/messagesub_text_field.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.contactUs, body: Padding(
      padding: EdgeInsetsDirectional.only(start: 26,end: 26,top: 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       CustomText(text: StringManger.messageSubject),
        SizedBox(height: 16.h,),
          MessageSubTextField(),
          SizedBox(height: 25.h,),
          CustomText(text: StringManger.message),
          MessageTextField(),
          SizedBox(height:53.h,),
          CustomButton(text: StringManger.send, onPressed: (){}),


      ],),
    ));
  }
}
