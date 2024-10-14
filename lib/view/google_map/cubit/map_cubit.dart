// import 'dart:typed_data';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:ui' as ui;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../models/request/filter_locations/filter_locations_request.dart';
// import '../../../models/response/filter_locations/filter_clinic_locations_response.dart';
// import '../../../models/response/filter_locations/filter_hospital_locations_response.dart';
// import '../../../models/response/filter_locations/filter_lab_locations_response.dart';
// import '../../../models/response/pharmacy/get_pharmacy_response.dart';
// import '../../../repository/repository.dart';
// import '../../../shared/statics/enum.dart';
// part 'map_state.dart';
//
//
//
// class MapCubit extends Cubit<MapState> {
//
//   MapCubit({required this.repository}) : super(MapState(markers: {},));
//   Repository repository;
//   MapTypeEnum? mapTypeEnum;
//
//   static MapCubit get(context) => BlocProvider.of(context);
//   static GoogleMapController? controller;
//   static Marker? startLocMarker;
//   static Marker? endLocationMarker;
//   double estimatedDistance = 0;
//   double bearing = 0;
//   Uint8List? imageBytes;
//
//   FilterClinicLocationsSuccessResponse? clinics;
//   FilterLabsLocationsSuccessResponse? labsOrScan;
//
//
//   FilterHospitalsLocationsResponse? hospitals;
//   GetPharmacyResponse? pharmacies;
//   List<GetPharmacyItem> getPharmacyItems=[];
//   static Map<MarkerId, Marker> markers = {};
//
//   static var location =
//       const CameraPosition(target: LatLng(30.0594628, 31.1760633), zoom: 16);
//
//   addClientMarker(
//     LatLng latLng,
//   ) async {
//     markers.clear();
//     var markerIdVal = latLng.toString();
//     final MarkerId markerId = MarkerId(markerIdVal);
//     double devicePixelRatio = ui.window.devicePixelRatio;
//     location = CameraPosition(target: latLng, zoom: 16);
//     startLocMarker = Marker(
//       icon: BitmapDescriptor.defaultMarker,
//       markerId: markerId,
//       position: LatLng(
//         latLng.latitude,
//         latLng.longitude,
//       ),
//       onTap: () {},
//     );
//
//     markers.addAll({
//       markerId: startLocMarker ?? Marker(markerId: markerId),
//     });
//     emit(MapState(
//       markers: markers,
//     ));
//   }
//
//   addMarkers({required List<LatLng> markersPosition}) {
//     for (LatLng position in markersPosition) {
//       var markerIdVal = position.toString();
//       final MarkerId markerId = MarkerId(markerIdVal);
//       // final Uint8List markerIcon = await BitmapDescriptorHelper.getBytesFromAsset(
//       //     AssetManger.helpIcon, 120);
//       double devicePixelRatio = ui.window.devicePixelRatio;
//       location = CameraPosition(target: position, zoom: 16);
//       // BitmapDescriptor icon = BitmapDescriptor.bytes(markerIcon);
//       // creating a new MARKER
//       Marker marker = Marker(
//        //  infoWindow: InfoWindow(title: 'client marker'),
//        // anchor: const Offset(0.5, 1.0),
//         icon: BitmapDescriptor.defaultMarker,
//         markerId: markerId,
//         position: LatLng(
//           position.latitude,
//           position.longitude,
//         ),
//         onTap: () {},
//       );
//       markers.addAll({markerId: marker});
//     }
//   }
//
//   getClinicsAround({required FilterLocationsRequest request}) async {
//     final clinicsAround =
//         await repository.filterClinicLocations(request: request);
//     clinicsAround.fold((error) {},
//             (success) {
//       clinics = success;
//       addMarkers(
//           markersPosition: clinics?.doctors?.resultItem
//                   .map(
//                     (e) => LatLng(e.latitude ?? 0.0, e.longitude ?? 0.0),
//                   )
//                   .toList() ??
//               []);
//     });
//     emit(MapState(markers: markers));
//   }
//
//   getLabsOrScanOrTherapyAround({required FilterLocationsRequest request}) async {
//
//     final labsOrScanAround =
//         await repository.filterLabsLocations(request: request);
//     labsOrScanAround.fold((error) {},
//             (success) {
//       labsOrScan = success;
//       addMarkers(
//           markersPosition: labsOrScan!.results?.map(
//                 (e) => LatLng(e.branch?.latitude ?? 0.0, e.branch?.longitude ?? 0.0),
//           )
//               .toList() ??
//               []);
//
//     });
//     emit(MapState(markers: markers));
//   }
//
//   getHospitalsAround({required FilterLocationsRequest request}) async {
//
//     final hospitalsAround =
//         await repository.filterHospitalsLocations(request: request);
//     hospitalsAround.fold(
//             (error) {},
//             (success) {
//               hospitals = success;
//            addMarkers(
//               markersPosition: hospitals?.doctors?.hospitalResultItem
//               .map(
//                 (e) => LatLng(e.latitude ?? 0.0, e.longitude ?? 0.0),
//           )
//               .toList() ??
//               []);
//
//     });
//     emit(MapState(markers: markers));
//   }
//
//   getPharmaciesAround({required FilterLocationsRequest request}) async {
//
//     final pharmaciesAround =
//         await repository.filterPharmaciesLocations(request: request);
//     pharmaciesAround.fold(
//             (error) {},
//             (success) {
//               pharmacies = success;
//            addMarkers(
//               markersPosition: pharmacies?.pharmacyItem
//               .map(
//                 (e) => LatLng(e.latitude ?? 0.0, e.longitude ?? 0.0),
//           )
//               .toList() ??
//               []);
//
//     });
//     emit(MapState(markers: markers));
//   }
//
//   resetMap() async {
//     clinics = null;
//     labsOrScan = null;
//     hospitals = null;
//     pharmacies=null;
//     markers = {};
//     emit(MapState(
//       markers: markers,
//     ));
//   }
// }
