import 'package:fi_khedmtk_sehtak/shared/resources/theme.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/service_locator.dart';
import 'package:fi_khedmtk_sehtak/view/bottom_main_screen/cubit/bottom_navigation_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 1034),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return  MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> NavigationCubit()),

          ],
          child: MaterialApp(
            theme:  MyTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute:RoutesManger.onGenerateRoute,
            navigatorKey: sl<NavigationService>().navigatorKey,
            initialRoute:Routes.onBoardingScreen,

          ),
        );},
    );
  }
}
