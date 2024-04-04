import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../shared/resources/strings_manger.dart';
import 'order_item.dart';


class OrderColumn extends StatelessWidget {
  const OrderColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
         OrderItem(text: StringManger.finished),
         SizedBox(width: 15.w,),
         OrderItem(text: StringManger.inComplete),
          SizedBox(width: 15.w,),
         OrderItem(text: StringManger.paid),
          SizedBox(width: 15.w,),
         OrderItem(text: StringManger.unpaid),
        ],),
      ],
    );
  }
}
