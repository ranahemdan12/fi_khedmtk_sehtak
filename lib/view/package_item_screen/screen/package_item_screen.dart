
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/expansion_panel_List.dart';
import '../widget/labes_grid_view.dart';
import '../widget/pack_Item_title4.dart';
import '../widget/pack_item_text2.dart';
import '../widget/pack_item_text3.dart';
import '../widget/pack_item_title_text.dart';
import '../widget/package_item_text5.dart';

class PackageItemScreen extends StatelessWidget {
  const PackageItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.packages, body: SingleChildScrollView(
      child: Column(
        children: [
      
          Container(
            width: double.infinity,
            height: 254.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      
      
            child: Image.asset(AssetManger.pacItem,
      
              fit: BoxFit.fill,
           ),
          ),
          SizedBox(height: 8.h,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 26,end: 23),
            child: Column(children: [
             PackItemTitleText1(),
              SizedBox(height: 8.h,),
              PackItemTitleText2(),
              SizedBox(height: 8.h,),
              PackItemTitleText3(),
              SizedBox(height: 8.h,),
              PackItemTitleText4(),
              Divider(
                color: ColorManger.dividerColor,
              ),
              Expansion(),
              SizedBox(height:6.h,),
              PackItemTitleText5(),
              SizedBox(height: 11.h,),
             LabsGridView(),
      
      
            ],),
          ),
      
        ],
      ),
    ));
  }
}
