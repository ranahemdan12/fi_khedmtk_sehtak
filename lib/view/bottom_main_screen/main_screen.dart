import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/resources/asset_manger.dart';
import '../../shared/resources/color_manger.dart';
import '../../shared/resources/strings_manger.dart';
import '../home_screen/screen/home_screen.dart';
import '../more/more_screen/more_screen.dart';
import '../orders_screen/screen/orders_screen.dart';
import 'cubit/bottom_navigation_cubit.dart';
import 'cubit/bottom_navigation_state.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Localizations.override(
        context: context,
        locale: context.locale,
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state is NavigationCurrentState) {
              return BottomNavigationBar(
                backgroundColor: ColorManger.whiteDColor,
                currentIndex: state.index,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorManger.blueColor,
                unselectedItemColor: ColorManger.mainColor,
                items: [
                  _bottomNavigationBarItem(
                      icon: AssetManger.homeIcon,
                      label: StringManger.home.tr(),
                      currentIndex: state.index,
                      iconIndex: 0),
                  _bottomNavigationBarItem(
                      icon: AssetManger.ordersIcon,
                      label: StringManger.orders.tr(),
                      currentIndex: state.index,
                      iconIndex: 1),
                  // _bottomNavigationBarItem(
                  //     icon: AssetManger.resultsIcon,
                  //     label: StringManger.results.tr(),
                  //     currentIndex: state.index,
                  //     iconIndex: 2),
                  // _bottomNavigationBarItem(
                  //     icon: AssetManger.packagesIcon,
                  //     label: StringManger.packages.tr(),
                  //     currentIndex: state.index,
                  //     iconIndex: 2),
                  _bottomNavigationBarItem(
                      icon: AssetManger.moreIcon,
                      label: StringManger.more.tr(),
                      currentIndex: state.index,
                      iconIndex: 2),
                ],
                onTap: (index) => _changeTabs(index: index, context: context),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state is NavigationCurrentState) {
            if (state.navigationBarTabs == NavigationBarTabs.home) {
              return const HomeScreen();
            } else if (state.navigationBarTabs == NavigationBarTabs.orders) {
              return  OrdersScreen();}
            // } else if (state.navigationBarTabs == NavigationBarTabs.results) {
            //   return const ResultsScreen();
            // else if (state.navigationBarTabs == NavigationBarTabs. packages) {
            //   return const PackagesScreen();
            // }
            else if (state.navigationBarTabs == NavigationBarTabs.more) {
              return const MoreScreen();
            }
          }
          return const Center(
            child: Text(  'homeScreen',
              style: TextStyle(fontSize: 19),
            ),
          );
        },
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavigationBarItem({
  required String icon,
  required String label,
  required int currentIndex,
  required int iconIndex,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        SvgPicture.asset(
          icon,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
              navIconColor(iconIndex: iconIndex, currentIndex: currentIndex),
              BlendMode.srcIn),
        ),
      ],
    ),
  );
}


Color navIconColor({
  required int iconIndex,
  required int currentIndex,
}) {
  return currentIndex == iconIndex
      ? ColorManger.blueColor
      : ColorManger.mainColor;
}



void _changeTabs({required int index, required BuildContext context}) {
  if (index == 0) {
    context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.home);
  } else if (index == 1) {
    context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.orders);}
  // } else if (index == 2) {
  //   context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.results);
  // }
  //    else if (index == 2) {
  //   context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.packages);
  // }
     else {
    context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.more);
  }
}

