import 'package:fi_khedmtk_sehtak/view/clinic_details_screen/about_screen/screen/about_clinic_screen.dart';
import 'package:fi_khedmtk_sehtak/view/clinic_details_screen/doctors_screen/screen/doctor_clinic_details_screen.dart';
import 'package:fi_khedmtk_sehtak/view/clinic_details_screen/insurances_screen/screen/insurances_clinic_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../reviews_screen/screen/reviews_clinic_details_screen.dart';

class ClinicDetailsTabBar extends StatefulWidget {
  const ClinicDetailsTabBar({Key? key}) : super(key: key);

  @override
  State<ClinicDetailsTabBar> createState() => _ClinicDetailsTabBarState();
}

class _ClinicDetailsTabBarState extends State<ClinicDetailsTabBar> with SingleTickerProviderStateMixin {
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
    return
       Container(
         height: 1200.h,
         child: Column(

          children: [TabBar(tabs: tabs,

              dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,


              unselectedLabelStyle:  GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color:  ColorManger.labelGrayColor,
              ),

              labelColor:  ColorManger.blueColor,
              labelStyle: GoogleFonts.montserrat(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color:  ColorManger.labelGrayColor,
              ),


              indicatorColor:  ColorManger.blueColor,

              controller:_tabController ,

            ),
          Expanded(
            child: TabBarView(
           controller: _tabController,
             children: [

               AboutClinicDetailsScreen(),
             DoctorClinicDetailsScreen(),
               ReviewsClinicDetailsScreen(),
             InsurancesClinicDetailsScreen(),



               ],),
               )],
               ),
       )
   ;

  }
}
List<Tab>tabs =[
  Tab(
    text: StringManger.about,
  ),
  Tab(
    text: StringManger.doctors,
  ),
  Tab(
    text: StringManger.reviews,
  ),
  Tab(
    text: StringManger.insurances,
  ),


];