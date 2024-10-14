import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/labs/services_response.dart';




class LabServiceCard extends StatelessWidget {
  const LabServiceCard({Key? key,required this.service}) : super(key: key);
final LabServiceModel? service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      // height:84.h ,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManger.mainColor),
        color: ColorManger.whiteDColor,
      ),
      child: ListTile(
        title: Text(service?.serviceName ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),

      ),

    );
  }
}


