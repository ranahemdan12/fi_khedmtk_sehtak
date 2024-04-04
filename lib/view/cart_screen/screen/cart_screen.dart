import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/custom_main_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScreen(text:StringManger.cart,
        actionWidget: IconButton(onPressed: (){  showAlertDialog(context);},icon: SvgPicture.asset(AssetManger.deleteIcon),),
        body: Padding(
              padding:EdgeInsetsDirectional.only(start: 26,end: 26),
              child: Column(
                children: [
                  SizedBox(
                    height: 27.h,
                  ),
                  MainCartContainer(),
                  SizedBox(
                    height: 16.h,
                  ),
                  MainCartContainer(),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(text:StringManger.checkOut, onPressed: (){}),

                ],
              ),
            ));



  }
}

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel",
        style:  GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorManger.blueGColor,
        ),),
      onPressed:  () {},
    );
    Widget deleteButton= TextButton(
      child: Text("Delete",
        style:  GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorManger.redColor,
        ),),
      onPressed:  () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          SvgPicture.asset(AssetManger.warnIcon),
          SizedBox(width: 8,),
          Text("Are you Sure!!",
            style:  GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManger.blackColor,
            ),),
        ],
      ),
      content: Text("You will delete all order  ",style:  GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorManger.blackColor,
      ),),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

