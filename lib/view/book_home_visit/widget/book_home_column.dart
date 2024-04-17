import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/view/book_home_visit/widget/book_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import 'drop_down_text_form_region.dart';
import 'drop_down_text_form_specialization.dart';

class BookHomeColumn extends StatelessWidget {
  BookHomeColumn({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Column(

        children: [
          SizedBox(
            height: 23.h,
          ),
          Image.asset(AssetManger.bookVisit),
          SizedBox(
            height: 20.h,
          ),
          Text(
            StringManger.bookVisit,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.blackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            StringManger.bookText1,
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.labelGrayColor,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(color: ColorManger.dividerColor,),
          SizedBox(
            height: 12.h,
          ),
          Text(
            StringManger.bookText2,
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.blueColor,
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
         BookTextField(text: StringManger.fullName, keyboardType: TextInputType.text, textEditingController: nameController, hintText: StringManger.fullName),
          SizedBox(
            height: 17.h,
          ),
         BookTextField(text: StringManger.phoneNumber, keyboardType: TextInputType.phone, textEditingController: phoneController, hintText: StringManger.phoneNumber),
          SizedBox(
            height: 17.h,
          ),
          DropDownTextFormSpecialization(),
          SizedBox(
            height: 17.h,
          ),
          DropDownTextFormRegion(),
          SizedBox(
            height: 42.h,
          ),
          CustomButton(text: StringManger.booking, onPressed: (){Navigator.pushNamed(context,Routes.successBookHomeVisitScreen);}),
          SizedBox(
            height: 42.h,
          ),
        ],
      ),
    );
  }
}
