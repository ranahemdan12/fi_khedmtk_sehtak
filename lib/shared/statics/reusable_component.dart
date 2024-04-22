import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';




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
      width: 161.w,
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
        titleSpacing: 0,
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
        Container(
          height: 60.h,
          child: TextField(
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
      height: 90.h,
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
          counterText: ' ',
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

class CustomRowLocation extends StatelessWidget{
  const CustomRowLocation({Key? key}) : super(key: key);

  // final List<String> items = [
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringManger.searchingIn,
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.labelGrayColor,
          ),
        ),
        Text('Giza, El-Dokki',
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorManger.redColor,
          ),),
        IconButton(onPressed: (){ Navigator.pushNamed(context, Routes.selectCityScreen);}, icon: Icon(Icons.arrow_drop_down)),

        // DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text('Giza, El-Dokki',
        //       style: GoogleFonts.montserrat(
        //         fontSize: 14.sp,
        //         fontWeight: FontWeight.w500,
        //         color: ColorManger.redColor,
        //       ),),
        //
        //     items: items
        //         .map((String item) => DropdownMenuItem<String>(
        //       value: item,
        //       child: Padding(
        //         padding:EdgeInsetsDirectional.only(start: 2),
        //         child: Text(
        //           item,
        //           style: GoogleFonts.montserrat(
        //             fontSize: 14.sp,
        //             fontWeight: FontWeight.w600,
        //             color: ColorManger.blueColor,
        //           ),
        //           overflow: TextOverflow.ellipsis,
        //         ),
        //       ),
        //     ))
        //         .toList(),
        //     value: selectedValue,
        //     onChanged: (String? value) {
        //       setState(() {
        //         selectedValue = value!;
        //       });
        //     },
        //
        //   ),
        // ),

      ],
    );
  }

}





