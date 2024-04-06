import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';


class GetShamelExpansion extends StatefulWidget {
  const GetShamelExpansion({Key? key}) : super(key: key);

  @override
  State<GetShamelExpansion> createState() => _GetShamelExpansionState();
}

class _GetShamelExpansionState extends State<GetShamelExpansion> {

  final bool customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManger.whiteGColor,

          border: Border.all(color: ColorManger.mainColor,),
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(title: Text('How to get Shamel discounts? ',
        style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color:ColorManger.blackColor ,
        ),),

        children: [
          Text('When you book or order with any provider included in Shamel network, ',
            maxLines: 5,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color:ColorManger.labelGrayColor ,
            ),

          ),
        ],

      ),
    );
  }
}
