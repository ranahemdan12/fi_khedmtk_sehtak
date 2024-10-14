// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../../../shared/statics/reusable_component.dart';
// import '../cubit/labs_reservation/labs_reservation_cubit.dart';
// import '../widget/lab_button.dart';
// import '../widget/labs_container.dart';
//
// class OrderLabsReservation extends StatefulWidget {
//   const OrderLabsReservation({super.key});
//
//   @override
//   State<OrderLabsReservation> createState() => _OrderLabsReservationState();
// }
//
// class _OrderLabsReservationState extends State<OrderLabsReservation> {
//   late final ScrollController _scrollController;
//
//
//
//
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//     // LabsReservationCubit.get(context)
//     //     .reserveLabs(reset: true);
//     super.initState();
//   }
//
//   void _onScroll() {
//     if (!_scrollController.hasClients) return;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     if (currentScroll == maxScroll) {
//       LabsReservationCubit.get(context).reserveLabs();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<LabsReservationCubit, LabsReservationState>(
//       listener: (context, state) {
//         if(state is LabsReservationError){
//           return showToast("Loading Failed");
//         }
//         else if(state is LabsReservationSuccess && state.error?.isNotEmpty==true){
//           return showToast("Loading Failed");
//         }
//       },
//         builder: (BuildContext context, state) {
//           if (state is LabsReservationLoading) {
//             return CustomScrollView(
//                 physics: const PageScrollPhysics(),
//                 controller: _scrollController,
//                 slivers: const [
//                   CustomSliverShimmer()
//                 ]);
//           }
//           if (state is LabsReservationSuccess) {
//             return CustomScrollView(
//              // physics: const PageScrollPhysics(),
//               controller: _scrollController,
//               slivers: [
//                 SliverList.builder(
//                   itemBuilder: (context, index) {
//                     return index >= state.reservation!.length &&
//                         state.reservation!.isNotEmpty
//                         ? const Center(child: CircularProgressIndicator())
//                         : Padding(
//                       padding: const EdgeInsetsDirectional.only(bottom: 8),
//                       child: Stack(
//                         children: [
//                           LabsContainer(reserve: state.reservation?[index],),
//                           LabButton(reserve: state.reservation?[index],),
//                         ],
//                       ),
//                     );
//                   },
//                   itemCount:state.reachedMax==true
//                       ? state.reservation?.length
//                       : state.reservation!.length + 1,
//                 )
//               ],
//             );
//           }
//           else if (state is LabsReservationError) {
//             return Center(child: Text(state.error));
//           }
//           else if (state is  LabsReservationEmpty) {
//             return Center(child: Text(StringManger.noReservation.tr()));
//           }
//           else {
//             return Container();
//           }
//         });
//   }
// }