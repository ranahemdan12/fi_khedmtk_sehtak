import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import '../statics/service_locator.dart';

class LocationHandler {
 static GeolocatorPlatform geoLocatorPlatform = GeolocatorPlatform.instance;

 Future askUserPermission() async {
   await requestPermission();
   await requestService();
/*   await getUserLocation();*/
   // trackUserLocation();
   // await userLocationMarker();
   return ;
 }
 var locationManager = sl<Location>();
 Future<bool> requestPermission() async {
   var permissionStatus = await locationManager.requestPermission();
   return permissionStatus == PermissionStatus.granted;
 }

 Future<bool> canUseGps() async {
   var permissionGranted = await isPermissionGranted();
   if (!permissionGranted) {
     return false;
   }
   var isServiceEnabled = await isLocationEnabled();
   if (!isServiceEnabled) {
     return false;
   }
   return true;
 }

 Future<LocationData?> getUserLocation() async {
   var canGetLocation = await canUseGps();
   if (!canGetLocation) return null;

   var locationData = await locationManager.getLocation();
   return locationData;

 }

 Future<bool> isLocationEnabled() async {
   return await locationManager.serviceEnabled();
 }

 Future<bool> requestService() async {
   var enabled = await locationManager.requestService();
   return enabled;
 }

 Future<bool> hasPermission() async {

return await  askUserPermission().then((value)async {
     bool granted = await isPermissionGranted();
     bool serviceEnabled = await isLocationEnabled();
     return granted && serviceEnabled;
   },);

 }

 Future<bool> isPermissionGranted() async {
   var permissionStatus = await locationManager.hasPermission();

   return permissionStatus == PermissionStatus.granted;
 }
/*  static Future<void> checkLocationPermission() async {
    final LocationPermission permission =
    await geoLocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      await geoLocatorPlatform.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      await geoLocatorPlatform.openLocationSettings();
    }
  }

  static Future<Position?> getAddress() async {
    Position? position;
    try {
      final LocationPermission permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        final result = await Geolocator.requestPermission();
        print(result);
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final serviceEnabled = await Geolocator.isLocationServiceEnabled();
        print('oooooooooooo $serviceEnabled');
        if (!serviceEnabled) {
         *//* Utils.showToast("GPS Service is Disabled");*//*
          final settings = await Geolocator.openLocationSettings();
        }

        position = await geoLocatorPlatform.getCurrentPosition(
          locationSettings:  const LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        );
        print(
            'this is user position User location : (${position.latitude},${position.longitude})');
      } else {

      }
    } catch (e) {
      print('Geolocator error : (${e.toString()})');
    }
    print('llllllllllllllllllllllllllllllllll $position');
    return position;
  }*/
}