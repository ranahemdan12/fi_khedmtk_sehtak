import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



import '../resources/asset_manger.dart';
import '../resources/color_manger.dart';
import '../resources/strings_manger.dart';

class CustomServiceItem extends StatelessWidget {
  CustomServiceItem({
    Key? key,
    required this.svgImage,
    required this.text,
  }) : super(key: key);

  final String text;
  final String svgImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManger.blueColor,
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 13),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                svgImage,
                width: 80.w,
                height: 80.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                text,
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManger.blueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  CustomScreen({
    Key? key,
    required this.text,
    required this.body,
    this.actionWidget,
  }) : super(key: key);

  final body;
  final String text;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorManger.whiteColor,
        ),
        title: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.whiteColor,
          ),
        ),
        actions: [actionWidget ?? const SizedBox()],
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            color: ColorManger.blueColor,
          ),
        ),
      ),
      body: body,
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.text,
    required this.keyboardType,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  final String text;
  TextInputType keyboardType;
  TextEditingController textEditingController;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.labelGrayColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
        TextField(
          keyboardType: keyboardType,
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsetsDirectional.only(start: 25, top: 15, bottom: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: ColorManger.whiteGColor,
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.labelGrayColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validate;
  TextInputType keyboardType;
  TextEditingController textEditingController;
  bool obscurePassword;

  String? hintText;

  CustomTextFormField({
    Key? key,
    required this.validate,
    required this.keyboardType,
    required this.textEditingController,
    required this.hintText,
    this.obscurePassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: TextFormField(
        validator: validate,
        keyboardType: keyboardType,
        controller: textEditingController,
        obscureText: obscurePassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: ColorManger.whiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: ColorManger.mainColor,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManger.blueColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.whiteColor,
          ),
        ),
      ),
    );
  }
}

class CustomServiceContainer extends StatelessWidget {
  CustomServiceContainer({
    Key? key,
    required this.text1,
    required this.richText1,
    required this.richText2,
    required this.richText3,
    required this.richText4,
  }) : super(key: key);

  String text1;
  String richText1;
  String richText2;
  String richText3;
  String richText4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: 79.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManger.blueColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 8, end: 15),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsetsDirectional.only(top: 35),
                child: Image.asset(AssetManger.coinIcon)),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      text1,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManger.blackColor,
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          ShowSheet(context);
                        },
                        child: SvgPicture.asset(AssetManger.plusIcon)),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                RichText(
                  text: TextSpan(
                    text: richText1,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManger.blackColor,
                    ),
                    children: [
                      TextSpan(
                        text: richText2,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManger.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                RichText(
                  text: TextSpan(
                    text: richText3,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManger.blackColor,
                    ),
                    children: [
                      TextSpan(
                        text: richText4,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManger.redColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void ShowSheet(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 274.h,
          width: 389.w,
          child: Column(

            children: [
              SizedBox(
                height: 33.h,
              ),
              CustomServiceContainer(
                text1: 'Blood Urea (Urea or BUN )',
                richText1: 'In case of cash ',
                richText2: '200 EGP',
                richText3: 'Booking through the application is ',
                richText4: '50 EGP ',
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SvgPicture.asset(AssetManger.plus2Icon),
                Text('Add Other Services',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManger.blueColor,
                  ),),
              ],),
              SizedBox(
                height: 31.h,
              ),
              Padding(
                padding:EdgeInsetsDirectional.symmetric(horizontal: 25),
                child: CustomButton(text: StringManger.chooseServiceProvider, onPressed:(){
                  Navigator.pushNamed(context, Routes.serviceProviderScreen);
                }),

              ),
              SizedBox(
                height: 17.h,
              ),

            ],
          ),

        );
      });
}
