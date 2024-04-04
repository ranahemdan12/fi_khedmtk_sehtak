import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/add_presc_container.dart';
import '../widget/presc_textfield.dart';
import '../widget/prescri_item.dart';

class AddPrescriptionScreen extends StatelessWidget {
  const AddPrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.addPrescription, body: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Column(
        children: [
          SizedBox(height:17.h ,),
          Row(

            children: [
              SizedBox(width:86.w ,),
            PrescriptionItem(text:StringManger.gallery, svgPic: AssetManger.galleryIcon,),
            SizedBox(width: 37.w,),
            PrescriptionItem(text:StringManger.camera, svgPic: AssetManger.cameraIcon)

          ],),
          SizedBox(height: 14.h,),
          AddPrescContainer(),
          SizedBox(height: 21.h,),
          PrescTextField(),
          SizedBox(height:53.h,),
          CustomButton(text: StringManger.send, onPressed: (){}),

        ],
      ),
    ));
  }
}
