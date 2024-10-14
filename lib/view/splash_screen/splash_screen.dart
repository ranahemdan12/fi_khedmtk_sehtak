import 'package:fi_khedmtk_sehtak/data/local/local_data_source.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/notifications_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/resources/asset_manger.dart';
import '../../shared/statics/service_locator.dart';
import '../auth/login_screen/screen/login_screen.dart';
import '../bottom_main_screen/main_screen.dart';
import '../more/profile_screen/cubit/profile_cubit/profile_cubit.dart';
import '../onboarding_screen/screen/on_boarding_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool showOnBoarding;
  @override
  void initState() {
    NotificationService().handleNotificationInBackground();
    NotificationService().handleNotificationInForeground();
    NotificationService().handleNotificationInTerminated();
    showOnBoarding = sl<LocalDataSource>().getOnBoarding();

    loadProfile();
    super.initState();
  }

loadProfile(){
  ProfileCubit.get(context).getProfile();
}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Scaffold(
            body: Center(
              child: Image.asset(
                AssetManger.splashLogo,
                width: 181.w,
                height: 181.h,
              ),
            ),
          );
        }
        else if (ProfileCubit.get(context).profile != null) {
          return const MainScreen();
        }
        else if (state is NoTokenState){
          return showOnBoarding != true
              ? const OnBoardingScreen()
              : const LoginScreen();
        }
        else if(state is ProfileErrorState ){
                return  Scaffold(
                  body: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error,size: 100.r,color: ColorManger.mainColor),
                        SizedBox(height: 60.h,),
                        Center(
                          child:
                            TextButton(
                              onPressed: (){
                                loadProfile();
                              },
                              child:  Text("Reload",
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorManger.blueColor),),
                            ),

                        )
                      ],
                    ),
                  ),
                );
        }
        else{
          return Scaffold(
            body: Container(
            ),
          );
        }
      },
    );
  }
}
