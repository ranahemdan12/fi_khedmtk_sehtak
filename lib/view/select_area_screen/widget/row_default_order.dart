import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';


class DefaultOrderRow extends StatefulWidget {
  const DefaultOrderRow({Key? key}) : super(key: key);

  @override
  State<DefaultOrderRow> createState() => _DefaultOrderRowState();
}

class _DefaultOrderRowState extends State<DefaultOrderRow> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String ?selectedValue ;

  @override
  Widget build(BuildContext context) {
    return
       Padding(
        padding:EdgeInsetsDirectional.only(start: 26,end: 24),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Patients ` Reviews',
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.blackColor,
              ),
            ),
            Container(
              height: 26.h,
              width: 138.w,
              color: ColorManger.blueCColor,
              child:DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text('Default Order',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManger.blueColor,
                    ),),

                  items: items
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding:EdgeInsetsDirectional.only(start: 2),
                    child: Text(
                      item,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManger.blueColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ))
                    .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                
                            ),
              ),

        ),]
      ),
    );
  }
}
