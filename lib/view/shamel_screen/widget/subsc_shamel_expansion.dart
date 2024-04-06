import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';



class SubscExpansion extends StatefulWidget {
  const SubscExpansion({Key? key}) : super(key: key);

  @override
  State<SubscExpansion> createState() => _SubscExpansion();
}

class _SubscExpansion extends State<SubscExpansion> {

  final bool customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManger.whiteGColor,

          border: Border.all(color: ColorManger.mainColor,),
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(title: Text('How to subscribe to Shamel? ',
        style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color:ColorManger.blackColor ,
        ),),

        children: [
          Text('You can choose the plan offered by Shamel & payonline with a valid card.completing the payment process, ',
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
