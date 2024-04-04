
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';


class Expansion extends StatefulWidget {
  const Expansion({Key? key}) : super(key: key);

  @override
  State<Expansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {

  final bool customIcon = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
     ExpansionTile(title: Text(StringManger.analysis),

       children: [
         Column(
           children: [
             ListTile(
               title: Text('ASOT ( Antistreptolysin 0 Latex )'),
               subtitle: Text('ASOT ( Antistreptolysin 0 Latex )'),
               titleTextStyle:  GoogleFonts.montserrat(
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w600,
                 color:ColorManger.blackColor ,
               ),
               subtitleTextStyle:  GoogleFonts.montserrat(
                 fontSize: 12.sp,
                 fontWeight: FontWeight.w600,
                 color:ColorManger.labelGrayColor ,
               ),
             ),
             SizedBox(height: 15.h,),
             Divider(color: ColorManger.dividerColor,),
             SizedBox(height: 15.h,),
             ListTile(
               title: Text('Complete Blood Picture ( CBC )'),
               subtitle: Text('Complete Blood Picture ( CBC ) - صورة دم كاملة '),
               titleTextStyle:  GoogleFonts.montserrat(
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w600,
                 color:ColorManger.blackColor ,
               ),
               subtitleTextStyle:  GoogleFonts.montserrat(
                 fontSize: 12.sp,
                 fontWeight: FontWeight.w600,
                 color:ColorManger.labelGrayColor ,
               ),
             ),
           ],
         )
       ],

     ),
    ],);
  }
}


// final List<String> items = [
//   'Item1',
//   'Item2',
//   'Item3',
//   'Item4',
// ];
// String? selectedValue;
//
// class DropDownList extends StatefulWidget {
//   const DropDownList({Key? key}) : super(key: key);
//
//   @override
//   State<DropDownList> createState() => _DropDownListState();
// }
//
// class _DropDownListState extends State<DropDownList> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 338.w,
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           hint: Text(StringManger.analysis,
//             style: GoogleFonts.montserrat(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color:ColorManger.blueColor ,
//             ),
//           ),
//             items: items
//                    .map((String item) => DropdownMenuItem<String>(
//                          value: item,
//                         child: Text(
//                            item,
//                           style: const TextStyle(
//                              fontSize: 14,
//                            ),
//                         ),
//                      ))
//                   .toList(),
//             value: selectedValue,
//             onChanged: (String? value) {
//             setState(() {
//                selectedValue = value;
//            });}),
//       ),
//     );
//     // return DropdownButton2<String>(
//     //   isExpanded: true,
//     //   hint: Text(
//     //     'Select Item',
//     //     style: TextStyle(
//     //       fontSize: 14,
//     //       color: Theme.of(context).hintColor,
//     //     ),
//     //   ),
//     //   items: items
//     //       .map((String item) => DropdownMenuItem<String>(
//     //             value: item,
//     //             child: Text(
//     //               item,
//     //               style: const TextStyle(
//     //                 fontSize: 14,
//     //               ),
//     //             ),
//     //           ))
//     //       .toList(),
//     //   value: selectedValue,
//     //   onChanged: (String? value) {
//     //     setState(() {
//     //       selectedValue = value;
//     //     });
//     //   },
//     //   buttonStyleData: ButtonStyleData(
//     //     padding: EdgeInsets.symmetric(horizontal: 16),
//     //     height: 40,
//     //     width: 140,
//     //   ),
//     //   menuItemStyleData: MenuItemStyleData(
//     //     height: 40,
//     //   ),
//     // );
//   }
// }
