// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../../../shared/statics/reusable_component.dart';
// import '../cubit/doctor_reservation/doctor_reservation_cubit.dart';
// import '../widget/doctor_button.dart';
// import '../widget/doctor_container.dart';
//
//
//
// class OrderDoctorReservation extends StatefulWidget {
//   const OrderDoctorReservation({super.key});
//
//   @override
//   State<OrderDoctorReservation> createState() => _OrderDoctorReservationState();
// }
//
// class _OrderDoctorReservationState extends State<OrderDoctorReservation> {
//   late final ScrollController _scrollController;
//
//
// // String  subSpecializationFunction(List<String> subClinics){
// //     String sub='';
// //     for (String element in (subClinics)) {
// //       sub = element==subClinics.last?     '$sub$element . ':'$sub$element ,';
// //     }
// //     return sub;
// //   }
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//     DoctorReservationCubit.get(context)
//         .reserveDoctor(reset: true);
//     super.initState();
//   }
//
//   void _onScroll() {
//     if (!_scrollController.hasClients) return;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     if (currentScroll == maxScroll) {
//       DoctorReservationCubit.get(context).reserveDoctor();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DoctorReservationCubit, DoctorReservationState>(
//       listener: (context, state) {
//         if(state is DoctorReservationError){
//          return showToast("Loading Failed");
//         }
//         else if(state is DoctorReservationSuccess && state.error?.isNotEmpty==true){
//           return showToast("Loading Failed");
//         }
//       },
//         builder: (BuildContext context, state) {
//       if (state is DoctorReservationLoading) {
//
//         return CustomScrollView(
//             physics: const PageScrollPhysics(),
//             controller: _scrollController,
//             slivers: const [
//               CustomSliverShimmer()
//             ]);
//       }
//       if (state is DoctorReservationSuccess) {
//         return CustomScrollView(
//           // physics: const PageScrollPhysics(),
//           controller: _scrollController,
//           slivers: [
//             SliverList.builder(
//               itemBuilder: (context, index) {
//                 return index >= state.reservation!.length &&
//                         state.reservation!.isNotEmpty
//                     ? const Center(child: CircularProgressIndicator())
//                     : Padding(
//                         padding: const EdgeInsetsDirectional.only(bottom: 8),
//                         child: Stack(
//                           children: [
//                             DoctorContainer(doctorReservationItem: state.reservation![index],),
//                             DoctorButton(doctorReservationItem: state.reservation![index],),
//                           ],
//                         ),
//                       );
//               },
//               itemCount: DoctorReservationCubit.get(context).reachedMax
//                   ? state.reservation?.length
//                   : state.reservation!.length + 1,
//             )
//           ],
//         );
//       }
//       else if (state is DoctorReservationError) {
//         return Center(child: Text(state.error));
//       }
//       else if (state is DoctorReservationEmpty) {
//         return Center(child: Text(StringManger.noReservation.tr()));
//       }
//       else {
//         return Container();
//       }
//     });
//   }
// }
