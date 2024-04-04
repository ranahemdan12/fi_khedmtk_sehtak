import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';

class PaymentRow extends StatelessWidget {
  const PaymentRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AssetManger.moneyIcon,
        ),
        SizedBox(width: 5.w,),
        RichText(
          text: TextSpan(
            text: 'Fees 500 EGP ',
            style: GoogleFonts.montserrat(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.blueColor,
            ),
            children: [
              TextSpan(text: '300 EGP With shamel',
                style: GoogleFonts.montserrat(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: ColorManger.redColor,
              ),),

            ],
          ),
        )

      ],
    );
  }
}
