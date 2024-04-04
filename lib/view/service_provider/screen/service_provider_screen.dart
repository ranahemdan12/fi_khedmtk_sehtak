import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/view/service_provider/best_price_screen/screen/best_price_screen.dart';
import 'package:fi_khedmtk_sehtak/view/service_provider/most_rated_screen/screen/most_rated_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';



class ServiceProviderScreen extends StatefulWidget {
  const ServiceProviderScreen({Key? key}) : super(key: key);

  @override
  State<ServiceProviderScreen> createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);

  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return CustomScreen(text: StringManger.serviceProvider,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),body: Padding(
      padding:EdgeInsetsDirectional.symmetric(horizontal: 26
      ),
      child: Column(
        children: [
          SizedBox(height:14.h ,),
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorManger.whiteDColor,
          ),

            child: TabBar(tabs: tabs,
             indicatorSize: TabBarIndicatorSize.tab,
             dividerColor: Colors.transparent,


              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Creates border
                  color: ColorManger.blueColor), //Change background color from here
              unselectedLabelStyle:  GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color:  ColorManger.labelGrayColor,
              ),

              labelColor:  ColorManger.whiteColor,


              indicatorColor:  ColorManger.blueColor,

              controller:_tabController ,

            ),
          ), Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BestPriceScreen(),
                MostRatedScreen(),

              ],),
          )
        ],

      ),
    ));
  }
}


List<Tab>tabs =[
  Tab(
    text: StringManger.bestPrice,
  ),
  Tab(
    text: StringManger.mostRated,
  ),


];

