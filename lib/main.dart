import 'package:fi_khedmtk_sehtak/shared/resources/theme.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/service_locator.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/shared_preference.dart';
import 'package:fi_khedmtk_sehtak/view/bottom_main_screen/cubit/bottom_navigation_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
 // await CacheHelper.init();
 // bool onBoarding = CacheHelper.getData(key: 'onBoarding');


  runApp( const MyApp(
      //onBoarding: onBoarding,)
       ));
}

class MyApp extends StatelessWidget {
  //final bool onBoarding;
  const  MyApp({super.key,
    //required this.onBoarding}
  });


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
           // initialRoute:onBoarding?Routes.loginScreen:Routes.onBoardingScreen,

          ),
        );},
    );
  }
}
