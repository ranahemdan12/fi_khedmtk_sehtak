import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';



class RowLocation extends StatelessWidget {
  const RowLocation({Key? key}) : super(key: key);

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
