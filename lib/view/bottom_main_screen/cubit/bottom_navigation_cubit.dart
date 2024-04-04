
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(
          NavigationCurrentState(
              navigationBarTabs: NavigationBarTabs.home, index: 0),
        );

  static NavigationCubit get(context) => BlocProvider.of(context);

  void getNavBarItem(NavigationBarTabs tabs) {
    switch (tabs) {
      case NavigationBarTabs.home:
        emit(NavigationCurrentState(
            navigationBarTabs: NavigationBarTabs.home, index: 0));
        break;

      case NavigationBarTabs. orders:
        emit(NavigationCurrentState(
            navigationBarTabs: NavigationBarTabs. orders, index: 1));
        break;

      case NavigationBarTabs.results:
        emit(NavigationCurrentState(
            navigationBarTabs: NavigationBarTabs.results, index: 2));
        break;

      case NavigationBarTabs. packages:
        emit(NavigationCurrentState(
            navigationBarTabs: NavigationBarTabs. packages, index: 3));
        break;

      case NavigationBarTabs.more:
        emit(NavigationCurrentState(
            navigationBarTabs: NavigationBarTabs.more, index: 4));
        break;
    }
  }
}
