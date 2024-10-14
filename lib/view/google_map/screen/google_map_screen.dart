// import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
// import 'package:fi_khedmtk_sehtak/view/google_map/cubit/map_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import '../../../models/request/filter_locations/filter_locations_request.dart';
// import '../../../shared/resources/color_manger.dart';
// import '../../../shared/resources/location_handler.dart';
// import '../../../shared/statics/enum.dart';
// import '../../../shared/statics/map.dart';
// import '../../clinic/doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
// import '../../labs/cubit/labs_cubit/labs_cubit.dart';
// import '../../pharmacy_screen/pharmacy_search_cubit/pharmacy_search_cubit.dart';
// import '../widgets/doctor_card.dart';
// import '../../pharmacy_screen/widget/pharmacy_pop_up.dart';
// import '../../pharmacy_screen/widget/pharmacy_list_view.dart';
// import '../../pharmacy_screen/widget/pharmacy_textfield.dart';
//
// class GoogleMapClinics extends StatefulWidget {
//   const GoogleMapClinics({
//     super.key,
//   });
//
//   @override
//   State<GoogleMapClinics> createState() => _GoogleMapClinicsState();
// }
//
// class _GoogleMapClinicsState extends State<GoogleMapClinics> {
//   GoogleMapController? mapController;
//   LocationHandler locationHandler = LocationHandler();
//   LatLng center = const LatLng(29.952654, 30.921919);
//   bool permissionGranted = false;
//   LocationData? currentPosition;
//   MapTypeEnum? mapTypeEnum;
//   AppointmentEnum? appointmentEnum;
//
//   moveToLocation() async {
//     bool granted = await locationHandler.hasPermission();
//
//     if (granted) {
//       currentPosition = await locationHandler.getUserLocation();
//
//       if (currentPosition != null && mapController != null) {
//         setState(() {
//           center = LatLng(currentPosition?.latitude ?? 0.0,
//               currentPosition?.longitude ?? 0.0);
//           permissionGranted = true;
//         });
//         mapController?.animateCamera(CameraUpdate.newCameraPosition(
//             CameraPosition(target: center, zoom: 15)));
//       }
//     } else {
//       return const SizedBox();
//     }
//   }
//
//   @override
//   void didChangeDependencies() {
//     mapTypeEnum = ModalRoute.of(context)!.settings.arguments as MapTypeEnum;
//     super.didChangeDependencies();
//   }
//
//   @override
//   void initState() {
//     MapCubit.get(context).resetMap();
//     Future.delayed(const Duration(milliseconds: 100)).then(
//       (value) async {
//         await moveToLocation();
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: ColorManger.whiteColor,
//         ),
//         titleSpacing: 0,
//         title: Row(children: [
//           Text(
//             mapTypeEnum == MapTypeEnum.doctors
//                 ? DoctorsInSpecialityCubit.get(context).selectedSpeciality.name!
//                 : mapTypeTitle[mapTypeEnum] ?? '',
//
//             style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: ColorManger.whiteColor,
//                 ),
//           ),
//         ]),
//         flexibleSpace: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//           ),
//           child: Container(
//             color: ColorManger.blueColor,
//           ),
//         ),
//       ),
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           BlocConsumer<MapCubit, MapState>(
//             listener: (context, state) async {},
//             builder: (context, state) {
//               return GoogleMap(
//                 markers: MapCubit.markers.values.toSet(),
//                 myLocationEnabled: mapTypeEnum == MapTypeEnum.pharmacy
//                     ? false
//                     : permissionGranted,
//                 myLocationButtonEnabled: permissionGranted,
//                 onMapCreated: (GoogleMapController controller) async {
//                   mapController = controller;
//                 },
//                 onTap: (LatLng position) async {
//                   await _addMarker(position, state);
//                 },
//                 initialCameraPosition: CameraPosition(target: center, zoom: 11),
//               );
//             },
//           ),
//           mapTypeEnum == MapTypeEnum.pharmacy
//               ? Positioned(
//                   left: 24,
//                   right: 24,
//                   top: 24,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BlocBuilder<MapCubit, MapState>(
//                             builder: (context, state) {
//                               return GestureDetector(
//                                 onTap: () async {
//                                   moveToLocation();
//                                   await _addMarker(
//                                       LatLng(currentPosition?.latitude ?? 0.0,
//                                           currentPosition?.longitude ?? 0.0),
//                                       state);
//                                 },
//                                 child: SvgPicture.asset(
//                                   AssetManger.location,
//                                   matchTextDirection: true,
//                                 ),
//                               );
//                             },
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               PharmacySearchCubit.get(context).resetPharmacy();
//                               showSheet(context);
//                             },
//                             child: SvgPicture.asset(
//                               AssetManger.searchLocation,
//                               matchTextDirection: true,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 580.h,
//                       ),
//                       SizedBox(
//                           height: (147.h + 77.h),
//                           width: 1000,
//                           child: DoctorCard(
//                             mapTypeEnum: mapTypeEnum,
//                           ))
//                     ],
//                   ))
//               : Positioned(
//                   bottom: 20,
//                   left: 10,
//                   right: 10,
//                   child: SizedBox(
//                       height: (147.h + 77.h),
//                       width: 1000,
//                       child: DoctorCard(
//                         mapTypeEnum: mapTypeEnum,
//                         appointmentEnum: appointmentEnum,
//                       ))),
//         ],
//       ),
//     );
//   }
//
//   _addMarker(LatLng position, state) async {
//     await MapCubit.get(context).addClientMarker(position);
//
//     if (MapCubit.markers.isNotEmpty &&
//         mapTypeEnum == MapTypeEnum.doctors &&
//         state.isLoading != true) {
//       await MapCubit.get(context).getClinicsAround(
//           request: FilterLocationsRequest(
//         lat: position.latitude,
//         long: position.longitude,
//         specializationId:
//             DoctorsInSpecialityCubit.get(context).selectedSpeciality.id,
//       ));
//     } else if (MapCubit.markers.isNotEmpty &&
//         (mapTypeEnum == MapTypeEnum.labs ||
//             mapTypeEnum == MapTypeEnum.scan ||
//             mapTypeEnum == MapTypeEnum.physical) &&
//         state.isLoading != true) {
//       await MapCubit.get(context).getLabsOrScanOrTherapyAround(
//           request: FilterLocationsRequest(
//               serviceId: LabsCubit.get(context).labsServiceModel?.id,
//               lat: position.latitude,
//               long: position.longitude,
//               serviceType: mapTypeEnum == MapTypeEnum.labs
//                   ? ServiceType.lab
//                   : mapTypeEnum == MapTypeEnum.scan
//                       ? ServiceType.scan
//                       : ServiceType.therapies));
//     } else if (MapCubit.markers.isNotEmpty &&
//         mapTypeEnum == MapTypeEnum.hospitals &&
//         state.isLoading != true) {
//       await MapCubit.get(context).getHospitalsAround(
//           request: FilterLocationsRequest(
//         lat: position.latitude,
//         long: position.longitude,
//       ));
//     } else if (MapCubit.markers.isNotEmpty &&
//         mapTypeEnum == MapTypeEnum.pharmacy &&
//         state.isLoading != true) {
//       await MapCubit.get(context).getPharmaciesAround(
//           request: FilterLocationsRequest(
//         lat: position.latitude,
//         long: position.longitude,
//       ));
//     }
//   }
// }
//
// void showSheet(context) {
//   showModalBottomSheet(
//       backgroundColor: ColorManger.whiteColor,
//       context: context,
//       builder: (BuildContext context) {
//         //CityCubit.get(context).getCity();
//         return SizedBox(
//           height: 667.h,
//           width: 390.w,
//           child: Padding(
//             padding:
//                 const EdgeInsetsDirectional.only(start: 16, end: 16, top: 23),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     const PharmacyTextField(),
//                     SizedBox(
//                       width: 8.w,
//                     ),
//                     const PharmacyPopUp(),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 const Expanded(
//                   child: PharmacyListView(),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
