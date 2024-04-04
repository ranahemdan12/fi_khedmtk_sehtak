import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../dentistry_screen/widget/number_text.dart';
import '../widget/labs_details_list_view.dart';
import '../widget/numbers_text.dart';

class LabsDetailsScreen extends StatelessWidget {
  const LabsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.labs,
      actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),


      body:
      SingleChildScrollView(

        child: Padding(
          padding:EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: Column(children: [
            SizedBox(height: 15.h,),
            Row(
              children: [
                NumberServiceText(),
                NumberText(text: '0'),
              ],
            ),
            SizedBox(height:15.h ,),
            LabsDetailsListView(),
            SizedBox(height:7.h ,),
            CustomButton(text: StringManger.confirmAndContinue, onPressed: (){}),
            SizedBox(height:15.h ,),
           
          ],),
        ),
      ),
    );
  }
}
