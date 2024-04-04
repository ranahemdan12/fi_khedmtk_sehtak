import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../widget/more_list_tile.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.more, body: SingleChildScrollView(
      child: Padding(
        padding:EdgeInsetsDirectional.only(start: 26,end: 26,top: 19),
        child: Column(children: [

          GestureDetector(onTap: (){
            Navigator.pushNamed(context, Routes.profileScreen);
          },
              child: MoreListTile(svgImage: AssetManger.profileTileIcon, text: StringManger.profile)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){Navigator.pushNamed(context, Routes.aboutScreen);},
              child: MoreListTile(svgImage: AssetManger.aboutIcon, text:StringManger.about)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){Navigator.pushNamed(context, Routes.contactScreen);},
              child: MoreListTile(svgImage: AssetManger.contactIcon, text:StringManger.contactUs)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){Navigator.pushNamed(context, Routes.helpScreen);},
              child: MoreListTile(svgImage: AssetManger.helpIcon, text:StringManger.help)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){Navigator.pushNamed(context, Routes.pointsScreen);},
              child: MoreListTile(svgImage: AssetManger.pointsIcon, text:StringManger.points)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){
            Navigator.pushNamed(context, Routes.paymentScreen);
          },
              child: MoreListTile(svgImage: AssetManger.paymentIcon, text:StringManger.payment)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){
            Navigator.pushNamed(context, Routes.termsScreen);
          },
              child: MoreListTile(svgImage: AssetManger.termsIcon, text:StringManger.terms)),
          SizedBox(height: 19.h,),
          MoreListTile(svgImage: AssetManger.refundIcon, text:StringManger.refund),
          SizedBox(height: 19.h,),
          MoreListTile(svgImage: AssetManger.presciIcon, text:StringManger.presc),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){
            Navigator.pushNamed(context, Routes.privacyScreen);
          },
              child: MoreListTile(svgImage: AssetManger.privacyIcon, text:StringManger.privacyPolicy)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){ Navigator.pushNamed(context, Routes.langScreen);},
              child: MoreListTile(svgImage: AssetManger.langIcon, text:StringManger.language)),
          SizedBox(height: 19.h,),
          GestureDetector(onTap: (){},
              child: MoreListTile(svgImage: AssetManger.logOutIcon, text:StringManger.logout)),


        ],),
      ),
    ));
  }
}
