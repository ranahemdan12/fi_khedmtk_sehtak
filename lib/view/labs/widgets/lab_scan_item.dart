
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_services_cubit/labs_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/service_locator.dart';

class LabScanItem extends StatefulWidget {
  LabScanItem({Key? key, required this.serviceIcon, this.serviceType,
    /*this.tab,*/required this.serviceText,required this.navToScreen, this.arguments}) : super(key: key);

  final String serviceIcon;
  final String serviceText;
/*  SelectedTab? tab;*/
  dynamic arguments;
  String navToScreen;
  ServiceType? serviceType;



  @override
  State<LabScanItem> createState() => _ServiceRowItemState();
}

class _ServiceRowItemState extends State<LabScanItem> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          // RegionCubit.get(context).selectedTab=widget.tab;
          widget.serviceType!=null?{
            LabsServicesCubit.get(context).serviceType=widget.serviceType,}:{};

          sl<NavigationService>().navigateTo(widget.navToScreen,arguments: widget.arguments);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorManger.blueColor,
              width: 2.w,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 21,),
                SvgPicture.asset(widget.serviceIcon,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,),
                SizedBox(height: 8.h,),
                Text(widget.serviceText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium
                ),
              ],
            ),
          ),
        ));
  }
}