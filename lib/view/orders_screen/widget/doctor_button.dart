// import 'package:easy_localization/easy_localization.dart';
// import 'package:fi_khedmtk_sehtak/shared/statics/extention.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
// import '../../../shared/resources/asset_manger.dart';
// import '../../../shared/resources/color_manger.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../../../shared/statics/reusable_component.dart';
// import '../cubit/cancel_clinic_reservation/cancel_clinic_reservation_cubit.dart';
// import '../cubit/doctor_reservation/doctor_reservation_cubit.dart';
//
//
//
// class DoctorButton extends StatefulWidget {
//   const DoctorButton({super.key,required this.doctorReservationItem});
//   final DoctorReservationItem? doctorReservationItem;
//
//   @override
//   State<DoctorButton> createState() => _DoctorButtonState();
// }
//
// class _DoctorButtonState extends State<DoctorButton> {
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<CancelClinicReservationCubit, CancelClinicReservationState>(
//       listener: (context, cancelState) {
//         if(cancelState is CancelClinicReservationSuccess && cancelState.doctorReservationItem?.id ==widget.doctorReservationItem?.id){
//
//           DoctorReservationCubit.get(context).
//           updateOrderStates(orderTd:widget.doctorReservationItem?.id,
//             states: "Cancelled",
//
//           );
//         }
//         else if (cancelState is CancelClinicReservationConfirmSuccess && cancelState.doctorReservationItem?.id ==widget.doctorReservationItem?.id){
//           DoctorReservationCubit.get(context).
//           updateOrderStates(orderTd:widget.doctorReservationItem?.id,
//             states: "Completed",
//           );
//         }
//       },
//       builder: (context, cancelState) {
//         // print("state is""${cancelState}");
//         if(cancelState is CancelClinicReservationLoading
//             && cancelState.id==widget.doctorReservationItem?.id){
//           return  Positioned(
//               bottom: 17.h,
//               left:context.isArabic? 10.w:null,
//               right: context.isArabic?null:10.w,
//               child: const CustomLoadingIndicator());
//         }
//         else {
//
//           return Positioned(
//             bottom: 17.h,
//             left:context.isArabic? 10.w:null,
//             right: context.isArabic?null:10.w,
//             child:
//             widget.doctorReservationItem?.reservationStatus=="Cancelled"?SvgPicture.asset(AssetManger.cancelIcon):widget.doctorReservationItem?.reservationStatus=="Completed"?SvgPicture.asset(AssetManger.confirmIcon): Row(
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
//                   onPressed: ()async {
//                     await CancelClinicReservationCubit.get(
//                         context)
//                         .confirmClinicReservation(
//                         orderId: widget.doctorReservationItem?.id);
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
//                     await CancelClinicReservationCubit.get(
//                         context)
//                         .cancelClinicReservation(
//                         orderId:  widget.doctorReservationItem?.id);
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
