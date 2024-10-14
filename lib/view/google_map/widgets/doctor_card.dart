// import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
// import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
// import 'package:fi_khedmtk_sehtak/view/clinic/doctor_info_in_speciality_screen/screen/doctor_info_in_speciality_screen.dart';
// import 'package:fi_khedmtk_sehtak/view/clinic/doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
// import 'package:fi_khedmtk_sehtak/view/google_map/cubit/map_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
// import '../../../models/response/hospitals/get_hospitals_branches.dart';
// import '../../../models/response/labs/labs_response.dart';
// import '../../../models/response/pharmacy/get_pharmacy_response.dart';
// import '../../../shared/statics/enum.dart';
// import '../../../shared/statics/routes.dart';
// import '../../../shared/statics/service_locator.dart';
// import '../../custom_screen/widget/appointment_grid_view.dart';
// import 'doctor_card_details.dart';
//
// //ignore: must_be_immutable
// class DoctorCard extends StatelessWidget {
//   DoctorCard({required this.mapTypeEnum,this.appointmentEnum, super.key,});
//
//   MapTypeEnum? mapTypeEnum;
//   AppointmentEnum? appointmentEnum;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MapCubit, MapState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//
//         if (MapCubit.get(context).clinics?.doctors?.resultItem.isNotEmpty ==
//                 true &&
//             mapTypeEnum == MapTypeEnum.doctors) {
//           List<ClinicsResultItem> clinics =
//               MapCubit.get(context).clinics?.doctors?.resultItem ?? [];
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: clinics.length,
//             clipBehavior: Clip.none,
//             itemBuilder: (context, index) {
//
//               return DoctorCardDetails(
//                 onTap: () {
//
//                   sl<NavigationService>().navigateTo(
//                       Routes.doctorInfoInScreen,
//                       arguments: ReserveDoctorAppointmentModel(clinic: clinics[index], specializationId: DoctorsInSpecialityCubit.get(context).selectedSpeciality.id??0));
//                 },
//                 mapCardData: MapCardData(
//                   image: clinics[index].doctor?.user?.image ?? '',
//                   name: clinics[index].doctor?.user?.firstName ?? '',
//                 ),
//               );
//             },
//           );
//         }
//
//         if (MapCubit.get(context).labsOrScan?.results?.isNotEmpty == true &&
//             mapTypeEnum == MapTypeEnum.labs) {
//           List<LabsResultsItem> labs =
//               MapCubit.get(context).labsOrScan?.results ?? [];
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: labs.length,
//             clipBehavior: Clip.none,
//             itemBuilder: (context, index) {
//               return DoctorCardDetails(
//                 key: UniqueKey(),
//                 onTap: (){
//                   sl<NavigationService>().navigateReplacementTo(
//                       Routes.appointmentScreen,
//                     arguments: AppointmentArguments(
//                       type:ServiceType.lab,
//                      AppointmentEnum.googleMap,
//                   appointments: MapCubit.get(context).labsOrScan!.results?[index].appointmentModel?.appointment??[],
//
//                     ),
//                   );
//                 },
//                 mapCardData: MapCardData(
//                   image: labs[index].branch?.user?.image ?? '',
//                   name: labs[index].branch?.user?.firstName ?? '',
//                 ),
//               );
//             },
//           );
//         }
//
//
//         if (MapCubit.get(context).labsOrScan?.results?.isNotEmpty == true &&
//             mapTypeEnum == MapTypeEnum.scan) {
//           List<LabsResultsItem> labs =
//               MapCubit.get(context).labsOrScan?.results ?? [];
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: labs.length,
//             clipBehavior: Clip.none,
//             itemBuilder: (context, index) {
//               return DoctorCardDetails(
//                 onTap: (){
//                   sl<NavigationService>().navigateReplacementTo(
//                       Routes.appointmentScreen,
//                     arguments: AppointmentArguments(
//                       type:ServiceType.scan,
//                       AppointmentEnum.googleMap,
//                       appointments:MapCubit.get(context).labsOrScan!.results?[index].appointmentModel?.appointment??[],
//
//                     ),
//                   );
//                 },
//                 mapCardData: MapCardData(
//                   image: labs[index].branch?.user?.image ?? '',
//                   name: labs[index].branch?.user?.firstName ?? '',
//                 ),
//               );
//             },
//           );
//         }
//
//
//         if (MapCubit.get(context).labsOrScan?.results?.isNotEmpty == true &&
//             mapTypeEnum == MapTypeEnum.physical) {
//           List<LabsResultsItem> labs =
//               MapCubit.get(context).labsOrScan?.results ?? [];
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: labs.length,
//             clipBehavior: Clip.none,
//             itemBuilder: (context, index) {
//               return DoctorCardDetails(
//                 onTap: (){
//                   sl<NavigationService>().navigateReplacementTo(
//                       Routes.appointmentScreen,
//                       arguments: AppointmentArguments(
//                         type:ServiceType.therapies,
//                         AppointmentEnum.googleMap,
//                         appointments:MapCubit.get(context).labsOrScan!.results?[index].appointmentModel?.appointment??[],
//
//                       ),
//
//                   );
//                 },
//                 mapCardData: MapCardData(
//                   image: labs[index].branch?.user?.image ?? '',
//                   name: labs[index].branch?.user?.firstName ?? '',
//                 ),
//               );
//             },
//           );
//         }
//
//
//         if (MapCubit.get(context).pharmacies?.pharmacyItem.isNotEmpty == true &&
//             mapTypeEnum == MapTypeEnum.pharmacy) {
//           List<GetPharmacyItem> pharmacy =
//               MapCubit.get(context).pharmacies?.pharmacyItem ?? [];
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: pharmacy.length,
//             clipBehavior: Clip.none,
//             itemBuilder: (context, index) {
//               return DoctorCardDetails(
//                 onTap: (){},
//                 mapCardData: MapCardData(
//                   image: pharmacy[index].user?.image ?? '',
//                   name: pharmacy[index].user?.firstName ?? '',
//                 ),
//               );
//             },
//           );
//         }
//
//
//
//         if (MapCubit.get(context).hospitals?.doctors?.hospitalResultItem.isNotEmpty == true &&
//             mapTypeEnum == MapTypeEnum.hospitals) {
//           List<HospitalResultItem> hospitals =
//               MapCubit.get(context).hospitals?.doctors?.hospitalResultItem ??
//                   [];
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: hospitals.length,
//             clipBehavior: Clip.none,
//             itemBuilder: (context, index) {
//               return DoctorCardDetails(
//                 onTap: (){
//
//                   sl<NavigationService>().navigateReplacementTo(
//                       Routes.hospitalServices,
//                       arguments: hospitals[index].hospital);
//                 },
//                 mapCardData: MapCardData(
//                   image: hospitals[index].hospital?.user?.image ?? ' ',
//                   name: hospitals[index].hospital?.user?.firstName ?? ' ',
//                 ),
//               );
//             },
//           );
//         }
//         else if (state.isLoading == true) {
//           return const Center(child: CustomLoadingIndicator());
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
