import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/order_column.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.orders, body: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 29),
      child: Column(
        children: [
          SizedBox(height: 30.h,),
          OrderColumn(),
          SizedBox(height: 177.h,),
          Image.asset(AssetManger.orderAnimation),
          SizedBox(height: 27.h,),
          Text(StringManger.noOrders,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.labelGrayColor,
            ),
          ),


        ],
      ),
    ));
  }
}
