import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/statics/service_locator.dart';
import '../../clinic/doc_specialization_screen/cubit/categories_cubit.dart';
import '../cubit/ads_cubit/ads_cubit.dart';
import '../widgets/adv_slider_screen.dart';
import '../widgets/list_tile_widget.dart';
import '../widgets/row_service_widget.dart';
import '../widgets/send_container.dart';
import '../widgets/service_grid_view.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    CategoriesCubit.get(context).getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
          create: (context) => sl<AdsCubit>(),
          child: Scaffold(

            body: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                const ListTileWidget(),
                SizedBox(height: 16.h,),
                const AdvSliderScreen(),
                SizedBox(height: 16.h,),
                const SendContainer(),
                SizedBox(height: 18.h,),
                const RowServiceWidget(),
                SizedBox(height: 16.h,),
                 ServiceGridView(),
                SizedBox(height: 18.h,),


              ],
            ),
          ),
        ));
  }
}
