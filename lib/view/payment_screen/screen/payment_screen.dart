import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/pay_textformfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? lang;


  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      text: StringManger.payment,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: ColorManger.whiteColor,
                border: Border.all(
                  color: ColorManger.whiteColor,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.shadowColor,
                    blurRadius: 8,
                    // offset: Offset(1, 1), // Shadow position
                  ),
                ],
              ),
              child: RadioListTile(
                selectedTileColor: ColorManger.blueColor ,
                activeColor: ColorManger.blueColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManger.fawry,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blackColor,
                      ),
                    ),
                    SvgPicture.asset(AssetManger.fawryIcon,fit: BoxFit.scaleDown,),
                  ],
                ),
                value: StringManger.fawry,
                groupValue: lang,
                onChanged: (value) {
                  setState(() {
                    lang = value.toString();
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(5),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManger.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: ColorManger.shadowColor,
                      blurRadius: 8,
                      // offset: Offset(1, 1), // Shadow position
                    ),
                  ],
                  border: Border.all(
                    color: ColorManger.dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  RadioListTile(
                    selectedTileColor: ColorManger.blueColor ,
                    activeColor: ColorManger.blueColor,
                    title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringManger.wallet,
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManger.blackColor,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(AssetManger.orangeIcon,fit: BoxFit.scaleDown,),
                            Image.asset(AssetManger.vodafoneIcon,fit: BoxFit.scaleDown,),
                          ],
                        ),
                      ],
                    ),
                    value: StringManger.wallet,
                    groupValue: lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 18.h,),
                  Padding(
                    padding:EdgeInsetsDirectional.symmetric(horizontal: 25),
                    child: PayTextFormField(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(5),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManger.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: ColorManger.shadowColor,
                      blurRadius: 8,
                      // offset: Offset(1, 1), // Shadow position
                    ),
                  ],
                  border: Border.all(
                    color: ColorManger.dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: RadioListTile(
                selectedTileColor: ColorManger.blueColor ,
                activeColor: ColorManger.blueColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManger.creditCard,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blackColor,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(AssetManger.masterCardIcon,),
                        SvgPicture.asset(AssetManger.visaIcon,fit: BoxFit.scaleDown,),
                      ],
                    ),
                  ],
                ),
                value: StringManger.creditCard,
                groupValue: lang,
                onChanged: (value) {
                  setState(() {
                    lang = value.toString();
                  });
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
