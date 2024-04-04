abstract class NavigationState {}

class NavigationCurrentState extends NavigationState {

  final NavigationBarTabs navigationBarTabs;
  final int index;

  NavigationCurrentState({required this.navigationBarTabs,required this.index} );
}
enum NavigationBarTabs{
  home,
 orders,
  results,
  packages,
  more,
}
