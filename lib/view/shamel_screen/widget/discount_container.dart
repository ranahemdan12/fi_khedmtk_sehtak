import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'discount_list_tile.dart';

class DiscountContainer  extends StatelessWidget {
  const DiscountContainer ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      width: 338.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManger.dividerColor),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          DiscountListTile(svg:AssetManger.clinicVisitIcon, text: 'Clinic Visits', text2: 'Discounts up to 40% on consultations & services',),

          Divider(color: ColorManger.dividerColor,),

          DiscountListTile(svg:AssetManger.clinicVisitIcon, text: 'Labs & Scans Centers', text2: 'Discounts up tp 70% with Shamel',),

          Divider(color: ColorManger.dividerColor,),
          DiscountListTile(svg:AssetManger.clinicVisitIcon, text: 'Hospitals ', text2: 'Discounted all-inclusive prices for operations with shamel',),

        ],
      ),
    );
  }
}
