import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/rating_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';

class RatingContainerRow extends StatelessWidget {
  const RatingContainerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingContainer(text: StringManger.doctorrating,),
          RatingContainer(text: StringManger.overallRating,),
        ],
      ),
    );
  }
}