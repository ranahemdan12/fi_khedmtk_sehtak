
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/inscExpansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'about_expansion.dart';

class ExpansionColumn extends StatelessWidget {
  const ExpansionColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InscExpansion(),
        SizedBox(height: 9.h,),
        AboutExpansion(),
        SizedBox(height: 9.h,),
        InscExpansion(),
      ],
    );
  }
}







