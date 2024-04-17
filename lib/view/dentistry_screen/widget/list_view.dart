import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';
import 'custom_container.dart';

class ContainerListView extends StatelessWidget {
  const ContainerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: PageScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: ( context,  index) => Padding(
        padding:EdgeInsetsDirectional.only(bottom: 15),
        child: CustomContainer(),
      ),
      itemCount: 20,);
  }
}
    // return  ListView.builder(
    //   shrinkWrap: true,
    //   scrollDirection: Axis.vertical,
    //   itemBuilder: ( context,  index) => Padding(
    //     padding:  EdgeInsetsDirectional.only(top: 15,start: 26,end: 26),
    //     child: ,
    //   ),
    //   itemCount: 10,);

