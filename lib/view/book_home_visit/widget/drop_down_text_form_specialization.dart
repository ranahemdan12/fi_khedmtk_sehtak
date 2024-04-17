import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class DropDownTextFormSpecialization extends StatefulWidget {
  const DropDownTextFormSpecialization({Key? key}) : super(key: key);

  @override
  State<DropDownTextFormSpecialization> createState() => _DropDownTextFormSpecializationState();
}
   String? dropdownValue;
class _DropDownTextFormSpecializationState extends State<DropDownTextFormSpecialization> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringManger.specialization,
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorManger.labelGrayColor,
          ),
        ),
        SizedBox(height: 5,),
        Container(
          height: 80.h,
          child: DropdownButtonFormField(
            decoration: const InputDecoration(

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor),
              ),
            ),

            hint:  Text(StringManger.specialization,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.whiteGreyColor,
            ),),
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Dermatology ', 'Neurology', 'Psychiatry', 'Orthopedics']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),),
        ),
      ],
    );
  }
}
