// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../../../shared/statics/reusable_component.dart';
// import '../cubit/hospital_reservation/hospital_reservation_cubit.dart';
// import '../widget/hospital_button.dart';
// import '../widget/hospital_container.dart';
//
//
// class OrderHospitalReservation extends StatefulWidget {
//   const OrderHospitalReservation({super.key});
//
//   @override
//   State<OrderHospitalReservation> createState() => _OrderHospitalReservationState();
// }
//
// class _OrderHospitalReservationState extends State<OrderHospitalReservation> {
//   late final ScrollController _scrollController;
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//     HospitalReservationCubit.get(context)
//         .reserveHospitals(reset: true);
//     super.initState();
//   }
//
//   void _onScroll() {
//     if (!_scrollController.hasClients) return;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     if (currentScroll == maxScroll) {
//       HospitalReservationCubit.get(context).reserveHospitals();
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<HospitalReservationCubit, HospitalReservationState>(
//       listener:  (context, state) {
//         if(state is HospitalReservationError){
//           return showToast("Loading Failed");
//         }
//         else if(state is HospitalReservationSuccess && state.error?.isNotEmpty==true){
//           return showToast("Loading Failed");
//         }},
//         builder: (BuildContext context, state) {
//           if (state is HospitalReservationLoading) {
//             return CustomScrollView(
//                 physics: const PageScrollPhysics(),
//                 controller: _scrollController,
//                 slivers: const [
//                   CustomSliverShimmer()
//                 ]);
//           }
//           if (state is HospitalReservationSuccess) {
//             return CustomScrollView(
//               //physics: const PageScrollPhysics(),
//               controller: _scrollController,
//               slivers: [
//                 SliverList.builder(
//                   itemBuilder: (context, index) {
//                     return index >= state.reservation!.length &&
//                         state.reservation!.isNotEmpty
//                         ? const Center(child: CircularProgressIndicator())
//                         : Padding(
//                           padding: const EdgeInsetsDirectional.only(bottom: 8),
//                          child: Stack(
//                         children: [
//                           HospitalContainer(hospitalReservationItem: state.reservation?[index],),
//                           HospitalButton(hospitalReservationItem: state.reservation?[index],),
//                         ],
//                       ),
//                     );
//                   },
//                   itemCount: HospitalReservationCubit.get(context).reachedMax
//                       ? state.reservation?.length
//                       : state.reservation!.length + 1,
//                 )
//               ],
//             );
//           }
//           else if (state is HospitalReservationError) {
//             return Center(child: Text(state.error));
//           }
//           else if (state is  HospitalReservationEmpty) {
//             return Center(child: Text(StringManger.noReservation.tr()));
//           }
//           else {
//             return Container();
//           }
//         });
//   }
// }