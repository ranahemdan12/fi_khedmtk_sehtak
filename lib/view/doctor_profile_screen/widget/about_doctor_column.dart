import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class AboutDoctorColumn extends StatelessWidget {
  const AboutDoctorColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringManger.aboutDoctor,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorManger.blueColor,
          ),
        ),
        Text('Dermatologist & Aesthetic medicinespecialist.Master degree of dermatologylasers & aesthetic medicine Kasralaini unversity',
          maxLines: 5,
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.labelGrayColor,
          ),
        ),
      ],
    );
  }
}
