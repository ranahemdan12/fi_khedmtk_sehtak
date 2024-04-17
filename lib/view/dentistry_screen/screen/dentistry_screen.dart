import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../widget/custom_container.dart';
import '../widget/list_view.dart';
import '../widget/number_text.dart';

class DentistryScreen extends StatelessWidget {
  const DentistryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.dentistry,
        actionWidget:    IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),
        body: SingleChildScrollView(
          child: Padding(
              padding:EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: Column(
                children: [
          
                  SizedBox(height: 15.h,),
          
                  ContainerListView(),
                  SizedBox(height: 28.h,),
                  CustomButton(text: 'Confirm and Continue', onPressed: (){
                    Navigator.pushNamed(context, Routes.serviceProviderScreen);
                  }),
                  SizedBox(height: 20.h,),
          
                ],
          
          
          
          
                  ),
            ),
        ),
        );
  }
}
