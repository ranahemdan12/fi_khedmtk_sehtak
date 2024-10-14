import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/statics/reusable_component.dart';
import 'custom_divider.dart';



class DoctorInfoColumn extends StatelessWidget {
  const DoctorInfoColumn({super.key,required this.docItemModel});
  final ClinicsResultItem? docItemModel;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 29.h,
        ),
        //doctor info
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(imageUrl:  docItemModel?.doctor?.user?.image ?? '', height: 60.h, width: 60.w, borderRadius: 50,fit: BoxFit.cover,),

            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  docItemModel?.doctor?.user?.firstName ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorManger.blackColor,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  docItemModel?.doctor?.specialization ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: ColorManger.greyItemColor),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
