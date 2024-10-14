import 'package:fi_khedmtk_sehtak/shared/resources/font_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/response/cart/get_cart_items.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';



class CartContainer extends StatelessWidget {
 const CartContainer({super.key,required this.cartItems});
   final Items? cartItems;

  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16,end: 16,top: 16),
          child: Stack(
            children: [

              Container(
                width: 358.w,
                decoration: BoxDecoration(
                  color: ColorManger.whiteDColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorManger.mainColor,),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,end: 16,top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  RichText(
                    textDirection: context.isArabic?TextDirection.ltr:TextDirection.rtl,

                  text: TextSpan(
                    text: "( ${cartItems?.serviceType??''}  )",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: FontSize.s14,
                        color: ColorManger.dividerColor2),


                  children: [
                     WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: SizedBox(width: 6.w)),
                    TextSpan(
                      text: cartItems?.serviceName??"",
                      style:Theme.of(context).textTheme.displayMedium?.copyWith( color: ColorManger.alarmBColor,
                          fontSize: FontSize.s16),
                    ),
                    ],
                   ),
                    ),
                      SizedBox(height: 8.h,),
                      Text('${cartItems?.servicePrice??0}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:Theme.of(context).textTheme.titleSmall?.copyWith( color: ColorManger.greyDropCityColor,
                            fontSize: FontSize.s14),),
                      SizedBox(height: 12.h,),
                      Text('${cartItems?.servicePrice??0}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:Theme.of(context).textTheme.labelLarge?.copyWith( color: ColorManger.blueColor,
                            fontSize: FontSize.s16),),
                      SizedBox(height: 16.h,),
                    ],
                  ),
                ),
              ),
              Positioned(
                left:context.isArabic? 16.w:null,
                right: context.isArabic?null:16.w,
                bottom: 16.h,
                child:
                Card(
                  elevation: 5,
                  child: Container(
                    height: 40.h,
                    // width: 72.w,
                    decoration: BoxDecoration(
                      color: ColorManger.cartColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            padding: REdgeInsets.all(5),
                            onPressed: (){}, icon: SvgPicture.asset(AssetManger.minusIcon)),

                        Text('1',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith( color: ColorManger.greyDropCityColor,
                            fontSize: FontSize.s16),),

                        IconButton(
                            padding: REdgeInsets.all(5),
                            onPressed: (){}, icon:SvgPicture.asset(AssetManger.plusIcon)),


                      ],


                    ),


                  ),
                ),
              ),


            ],
          ),



    );
  }
}
