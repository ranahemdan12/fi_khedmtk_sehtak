import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/response/notification/get_notification.dart';
import '../../../shared/resources/color_manger.dart';


class NotificationContainer extends StatelessWidget {
   NotificationContainer({super.key,required this.notificationResultItem});
  NotificationResultItem?notificationResultItem;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16,end:16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetManger.redIcon),
              SizedBox(width: 4.w,),
              SvgPicture.asset(AssetManger.alarmIcon),
              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                Text(notificationResultItem?.message??'',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.alarmBColor),),
                  SizedBox(width: 4.w,),
                  Text(notificationResultItem?.message??'',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: FontSize.s14,
                      color: ColorManger.alarmColor
                    )),
                  SizedBox(width: 8.w,),
                  Text(notificationResultItem?.createdAt?.substring(11,16)??'',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: FontSize.s14,
                          color: ColorManger.alarmGColor
                      )),
                  SizedBox(width: 16.w,),



                ],
              ),

            ],
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 23,end: 23),
            child: Divider(),
          ),
          SizedBox(height: 16.h,),
        ],
      ),
    );
    // return Container(
    //   width: 360.w,
    //   margin: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     border: Border.all(color: ColorManger.mainColor),
    //     color: ColorManger.whiteDColor,
    //   ),
    //   child: ListTile(
    //     title: Text(notificationResultItem?.message??'',
    //       overflow: TextOverflow.ellipsis,
    //       maxLines: 2,
    //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManger.greyProfileColor),),
    //     subtitle:  Row(
    //       children: [
    //         Text(notificationResultItem?.createdAt?.substring(11,16)??'',
    //           overflow: TextOverflow.ellipsis,
    //           maxLines: 1,
    //           style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorManger.blueColor
    //           ),),
    //
    //         SizedBox(width: 10.w,),
    //
    //         Text(notificationResultItem?.createdAt?.substring(1,10)??'',
    //           overflow: TextOverflow.ellipsis,
    //           maxLines: 1,
    //           style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorManger.blueColor
    //           ),),
    //
    //       ],
    //     ),
    //
    //
    //
    //   ),
    // );
  }
}
