
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';


final sl =GetIt.instance;

class ServiceLocator{

  static Future <void> init () async {
    sl.registerLazySingleton<NavigationService>(() => NavigationService());
  }

}