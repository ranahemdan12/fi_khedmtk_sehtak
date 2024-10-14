// import 'package:easy_localization/easy_localization.dart';
// import 'package:fi_khedmtk_sehtak/shared/statics/extention.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../models/response/labs/reserve_lab_service_response.dart';
// import '../../../shared/resources/asset_manger.dart';
// import '../../../shared/resources/color_manger.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../../../shared/statics/reusable_component.dart';
// import '../cubit/cancel_labs_reservatiom/cancel_labs_reservation_cubit.dart';
// import '../cubit/labs_reservation/labs_reservation_cubit.dart';
//
//
//
//
// class LabButton extends StatefulWidget {
//   const LabButton({super.key,required this.reserve});
//   final ReserveLabServiceSuccessResponse? reserve;
//
//   @override
//   State<LabButton> createState() => _LabButtonState();
// }
//
// class _LabButtonState extends State<LabButton> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CancelLabsReservationCubit,
//         CancelLabsReservationState>(
//       listener: (context, cancelLabState) {
//         if(cancelLabState is CancelLabsReservationSuccess &&
//             cancelLabState.reserveLabServiceSuccessResponse.id == widget.reserve?.id){
//           LabsReservationCubit.get(context).
//           updateOrderStates(orderTd:widget.reserve?.id,
//               states: "Cancelled");}
//         else if (cancelLabState is CancelLabsReservationConfirmSuccess && cancelLabState.reserveLabServiceSuccessResponse.id ==widget.reserve?.id){
//           LabsReservationCubit.get(context).
//           updateOrderStates(orderTd:widget.reserve?.id,
//               states: "Completed");
//         }
//
//       },
//       builder: (context, cancelState) {
//
//         if(cancelState is CancelLabsReservationLoading &&
//             cancelState.id==widget.reserve?.id){
//           return  Positioned(
//               bottom: 19,
//               left: context. isArabic?10.w:null,
//               right: context.isArabic?null:10.w,
//               child: const CustomLoadingIndicator());
//         }
//         else {
//           return
//             Positioned(
//               bottom: 17.h,
//               left: context.isArabic?10.w:null,
//               right: context.isArabic?null:10.w,
//
//               child:
//               widget.reserve?.reservationStatus=="Cancelled"?SvgPicture.asset(AssetManger.cancelIcon):widget.reserve?.reservationStatus=="Completed"?SvgPicture.asset(AssetManger.confirmIcon):
//               Row(
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(66, 31),
//                         backgroundColor:
//                         ColorManger.greenColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.circular(8),
//                         )),
//                     onPressed: ()async {
//
//                       await CancelLabsReservationCubit.get(
//                           context)
//                           .confirmLabsReservation(
//                         orderId:  widget.reserve?.id,
//                         serviceType: LabsReservationCubit.get(context).serviceType,);},
//                     child: Text(
//                       StringManger.confirm.tr(),
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 4.w,
//                   ),
//
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(58, 31),
//                         backgroundColor:
//                         ColorManger.redColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.circular(8),
//                         )),
//                     onPressed: () async{
//
//                       await CancelLabsReservationCubit.get(
//                           context)
//                           .cancelLabsReservation(orderId:widget.reserve?.id, serviceType: LabsReservationCubit.get(
//                           context)
//                           .serviceType,
//                       );
//                     },
//                     child: Text(
//                       StringManger.cancel.tr(),
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium,
//                     ),
//                   )
//
//
//                 ],
//               ),
//             );
//         }
//
//
//       },
//     );
//   }
// }
