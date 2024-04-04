import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../shared/resources/asset_manger.dart';
import '../../shared/resources/color_manger.dart';
import '../../shared/resources/strings_manger.dart';
import '../home_screen/screen/home_screen.dart';
import '../more_screen/screen/more_screen.dart';
import '../orders_screen/screen/orders_screen.dart';
import '../packages_screen/screen/packages_screen.dart';
import '../results_screen/screen/results_screen.dart';
import 'cubit/bottom_navigation_cubit.dart';
import 'cubit/bottom_navigation_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state is NavigationCurrentState) {
            return BottomNavigationBar(
              currentIndex: state.index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorManger.blueColor
              ,
              unselectedItemColor: ColorManger.mainColor,
              items: [
                _bottomNavigationBarItem(
                    icon: AssetManger.homeIcon,
                    label: StringManger.home,
                    currentIndex: state.index,
                    iconIndex: 0),
                _bottomNavigationBarItem(
                    icon: AssetManger.ordersIcon,
                    label: StringManger.orders,
                    currentIndex: state.index,
                    iconIndex: 1),
                _bottomNavigationBarItem(
                    icon: AssetManger.resultsIcon,
                    label: StringManger.results,
                    currentIndex: state.index,
                    iconIndex: 2),
                _bottomNavigationBarItem(
                    icon: AssetManger.packagesIcon,
                    label: StringManger.packages,
                    currentIndex: state.index,
                    iconIndex: 3),
                _bottomNavigationBarItem(
                    icon: AssetManger.moreIcon,
                    label: StringManger.more,
                    currentIndex: state.index,
                    iconIndex: 4),
              ],
              onTap: (index) => _changeTabs(index: index, context: context),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state is NavigationCurrentState) {
            if (state.navigationBarTabs == NavigationBarTabs.home) {
              return HomeScreen();
            } else if (state.navigationBarTabs ==
                NavigationBarTabs.orders) {
              return OrdersScreen();
            } else if (state.navigationBarTabs == NavigationBarTabs.results) {
              return ResultsScreen();
            } else if (state.navigationBarTabs == NavigationBarTabs. packages) {
              return PackagesScreen();
            } else if (state.navigationBarTabs == NavigationBarTabs.more) {
              return MoreScreen();
            }
          }
          return Center(
            child: Text(
              'homeScreen',
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
    context
        .read<NavigationCubit>()
        .getNavBarItem(NavigationBarTabs.orders);
  } else if (index == 2) {
    context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.results);
  } else if (index == 3) {
    context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.packages);
  } else {
    context.read<NavigationCubit>().getNavBarItem(NavigationBarTabs.more);
  }
}

