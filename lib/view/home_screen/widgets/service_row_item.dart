import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_services_cubit/labs_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/response/clinic/get_specialization/get_specialization.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/service_locator.dart';


//ignore: must_be_immutable
class ServiceRowItem extends StatefulWidget {
    ServiceRowItem({Key? key, required this.serviceIcon, this.serviceType,this.model,
      /*this.tab,*/required this.serviceText,required this.navToScreen, this.arguments}) : super(key: key);

  final String serviceIcon;
  final String serviceText;

  dynamic arguments;
 String navToScreen;
  ServiceType? serviceType;
    SpecializationResponseModel? model;



  @override
  State<ServiceRowItem> createState() => _ServiceRowItemState();
}

class _ServiceRowItemState extends State<ServiceRowItem> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap: (){
            // RegionCubit.get(context).selectedTab=widget.tab;
            widget.serviceType!=null?{
              LabsServicesCubit.get(context).serviceType=widget.serviceType,}:{};

           widget.model?.isDentist==true?{


           }:{};


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
                  width: 50.w,
                  height: 50.h,
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
