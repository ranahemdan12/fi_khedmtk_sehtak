import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';



class ShamelExpansion extends StatefulWidget {
  const ShamelExpansion({Key? key}) : super(key: key);

  @override
  State<ShamelExpansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<ShamelExpansion> {

  final bool customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(color: ColorManger.whiteGColor,
      
      border: Border.all(color: ColorManger.mainColor,),
      borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(title: Text('What is Shamel?',
        style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color:ColorManger.blackColor ,
        ),),

        children: [
          Text('Shamel is a subscription providing affordabilitysolution that offers various benefits and discounts',
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
