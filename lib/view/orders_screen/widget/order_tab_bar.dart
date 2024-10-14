// import 'package:easy_localization/easy_localization.dart';
// import 'package:fi_khedmtk_sehtak/shared/statics/enum.dart';
// import 'package:fi_khedmtk_sehtak/shared/statics/map.dart';
// import 'package:flutter/material.dart';
// import '../../../shared/resources/color_manger.dart';
// import '../../../shared/resources/strings_manger.dart';
// import '../cubit/labs_reservation/labs_reservation_cubit.dart';
// import '../screen/hospital_reservation.dart';
// import '../screen/labs_reservation.dart';
// import '../screen/order_doctor_reservation.dart';
//
//
//
//
// //ignore: must_be_immutable
// class OrderTabBar extends StatefulWidget {
//     OrderTabBar({super.key,required this.orderType});
//     ReserveOrderTypeEnum? orderType;
//
//   @override
//   State<OrderTabBar> createState() => _OrderTabBarState();
// }
//
// class _OrderTabBarState extends State<OrderTabBar>with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//
//   List<Tab>tabs =[
//     Tab(text:StringManger.doctor.tr() ,),
//     Tab(text:StringManger.hospitals.tr(),),
//     Tab(text:StringManger.labs.tr() ,),
//     Tab(text:StringManger.physicalTherapy.tr() ,),
//     Tab(text:StringManger.dentist.tr() ,),
//   ];
//   updateCurrentTab(int index){
//     setState(() {
//       currentTab = index;
//     });
//   }
//   int? currentTab=0;
//
//
//  @override
//   void initState() {
//   _tabController = TabController(vsync: this, length: tabs.length)
//   ..addListener((){
//
//     if(_tabController?.index==2){
//       LabsReservationCubit.get(context).serviceType=ServiceType.lab;
//
//     }else if(_tabController?.index==3){
//       LabsReservationCubit.get(context).serviceType=ServiceType.therapies;
//
//     }
//     else if(_tabController?.index==4){
//       LabsReservationCubit.get(context).serviceType=ServiceType.scan;
//
//     }
//     if((currentTab!= _tabController?.index) && (_tabController?.index == 2 ||_tabController?.index == 3 || _tabController?.index == 4) ){
//       LabsReservationCubit.get(context).reserveLabs(reset: true);
//       updateCurrentTab(_tabController?.index??0);
//     }
//
//   });
//   navToTap();
//   super.initState();
//   }
//
//   navToTap(){
//    _tabController?.animateTo(orderTabBar[widget.orderType]??0);
//   }
//
//
//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    return Column(
//       children: [
//         Localizations.override(
//           context: context,
//           locale: context.locale,
//           child: TabBar(
//
//             // onTap:(value) {/*
//             //   if(value==2){
//             //     LabsReservationCubit.get(context).serviceType=ServiceType.lab;
//             //   }else if(value==3){
//             //     LabsReservationCubit.get(context).serviceType=ServiceType.therapies;
//             //   }
//             //   else if(value==4){
//             //     LabsReservationCubit.get(context).serviceType=ServiceType.scan;
//             //   }*/
//             //   // if(value == 2 ||value == 3 || value == 4 ){
//             //   //   LabsReservationCubit.get(context)
//             //   //       .reserveLabs(reset: true);
//             //   // }
//             // },
//             isScrollable: true,
//             tabs: tabs,
//             tabAlignment: TabAlignment.start,
//             dividerColor: Colors.transparent,
//           indicatorSize: TabBarIndicatorSize.tab,
//             physics: const ClampingScrollPhysics(),
//           padding: const EdgeInsetsDirectional.only(top: 16,bottom: 17,start: 16,end: 16),
//           unselectedLabelStyle:  Theme.of(context).textTheme.bodyMedium?.copyWith(
//             color: ColorManger.labelGrayColor,),
//           labelColor:  ColorManger.whiteColor,
//           labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//             color: ColorManger.whiteColor,),
//           indicator: BoxDecoration(
//             // shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(23),
//             color: ColorManger.blueColor,),
//           controller:_tabController ,
//           ),),
//
//
//         Expanded(
//           child: TabBarView(
//             // physics: const NeverScrollableScrollPhysics(),
//             controller: _tabController,
//             children:   const [
//               OrderDoctorReservation(),
//               OrderHospitalReservation(),
//               OrderLabsReservation(),
//               OrderLabsReservation(),
//               OrderLabsReservation(),
//
//             ],),
//         )
//       ],
//     );
//   }
// }

