// import 'package:easy_localization/easy_localization.dart';
// import 'package:fi_khedmtk_sehtak/shared/statics/extention.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../models/response/hospitals/get_hospital_reservation.dart';
// import '../../../shared/resources/asset_manger.dart';
// import '../../../shared/resources/color_manger.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../../../shared/statics/reusable_component.dart';
// import '../cubit/cancel_hospital_reservation/cancel_hospital_reservation_cubit.dart';
// import '../cubit/hospital_reservation/hospital_reservation_cubit.dart';
//
//
//
//
//
// class HospitalButton extends StatefulWidget {
//   const HospitalButton({super.key,required this.hospitalReservationItem});
//   final HospitalReservationItem?hospitalReservationItem;
//
//   @override
//   State<HospitalButton> createState() => _HospitalButtonState();
// }
//
// class _HospitalButtonState extends State<HospitalButton> {
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<CancelHospitalReservationCubit,
//         CancelHospitalReservationState>(
//       listener: (context, cancelState) {
//         if(cancelState is CancelHospitalReservationSuccess && cancelState.hospitalReservationItem?.id ==widget.hospitalReservationItem?.id){
//
//           HospitalReservationCubit.get(context).
//           updateOrderStates(orderId:widget.hospitalReservationItem?.id,
//               states: "Cancelled");
//         }
//         else if (cancelState is CancelHospitalConfirmReservationSuccess && cancelState.hospitalReservationItem?.id ==widget.hospitalReservationItem?.id){
//
//           HospitalReservationCubit.get(context).
//           updateOrderStates(orderId:widget.hospitalReservationItem?.id,
//               states: "Completed");
//         }
//       },
//       builder: (context, cancelState) {
//
//         if(cancelState is CancelHospitalReservationLoading
//             && cancelState.id==widget.hospitalReservationItem?.id){
//           return  Positioned(
//               bottom: 17.h,
//               left: context.isArabic?10.w:null,
//               right: context.isArabic?null:10.w,
//               child: const CustomLoadingIndicator());
//         }
//         else {
//           return Positioned(
//             bottom: 17.h,
//             left: context.isArabic?10.w:null,
//             right: context.isArabic?null:10.w,
//             child:
//             widget.hospitalReservationItem?.reservationStatus=="Cancelled"|| widget.hospitalReservationItem?.reservationStatus=="ملغي"?SvgPicture.asset(AssetManger.cancelIcon):widget.hospitalReservationItem?.reservationStatus=="Completed"||widget.hospitalReservationItem?.reservationStatus=="مكتمل"?SvgPicture.asset(AssetManger.confirmIcon):
//             Row(
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(66, 31),
//                       backgroundColor:
//                       ColorManger.greenColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                         BorderRadius.circular(8),
//                       )),
//                   onPressed: () async{
//                     await CancelHospitalReservationCubit.get(
//                         context)
//                         .confirmHospitalReservation(
//                         orderId: widget.hospitalReservationItem?.id);
//
//                   },
//                   child: Text(
//                     StringManger.confirm.tr(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleMedium,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 4.w,
//                 ),
//
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(58, 31),
//                       backgroundColor:
//                       ColorManger.redColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                         BorderRadius.circular(8),
//                       )),
//                   onPressed: () async{
//                     await CancelHospitalReservationCubit.get(
//                         context)
//                         .cancelHospitalReservation(
//                         orderId: widget.hospitalReservationItem?.id);
//                   },
//                   child: Text(
//                     StringManger.cancel.tr(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleMedium,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//
//
//       },
//     );
//   }
// }
