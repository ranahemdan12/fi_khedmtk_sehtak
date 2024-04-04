import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/adv_slider_screen.dart';
import '../widgets/list_tile_widget.dart';
import '../widgets/packages_grid_view.dart';
import '../widgets/row_package_widget.dart';
import '../widgets/row_service_widget.dart';
import '../widgets/send_container.dart';
import '../widgets/service_row.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
           children: [
             SizedBox(
            height: 30.h,
           ),
           ListTileWidget(),
             SizedBox(
               height: 12.h,
             ),
             AdvSliderScreen(),
             SizedBox(height: 12.h,),
             SendContainer(),
             SizedBox(height: 18.h,),
             RowServiceWidget(),
             SizedBox(height: 16.h,),
             ServiceRow(),
             SizedBox(height: 18.h,),
             RowPackageWidget(),
             SizedBox(height: 21.h,),

              PackagesGridView(),

        ],
      ),
    ));
  }
}
