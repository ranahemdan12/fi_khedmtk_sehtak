import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../widget/book_home_column.dart';

class BookHomeVisitScreen extends StatelessWidget {
  const BookHomeVisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.bookVisitDoctor,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),
        body: SingleChildScrollView(child: BookHomeColumn()),

    );
  }
}
