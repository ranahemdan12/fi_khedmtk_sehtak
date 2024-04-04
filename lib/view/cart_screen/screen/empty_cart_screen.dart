import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.cart, body:  Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 232.h,
                  ),
                  Image.asset(AssetManger.paperIcon,
                    fit: BoxFit.scaleDown,),
                  Text(
                    StringManger.noCart,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorManger.labelGrayColor,
                    ),
                  ),
                ],
              ),
            ),
         );





  }
}
