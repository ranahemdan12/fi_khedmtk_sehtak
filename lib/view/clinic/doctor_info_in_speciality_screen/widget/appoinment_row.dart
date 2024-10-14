import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/models/request/cart/add_to_cart.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/cart_cubit/add_to_cart_screen/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/add_card_webview.dart';
import '../../../../shared/statics/enum.dart';
import '../../../../shared/statics/navigation_service.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../../orders_screen/screen/orders_screen.dart';
import '../doctor_post_reservation_cubit/post_doctor_reservation_cubit.dart';
import '../screen/doctor_info_in_speciality_screen.dart';



class AppointmentRow extends StatefulWidget {
  const AppointmentRow({super.key, required this.docItemModel, required this.args});

  final ClinicsResultItem? docItemModel;
  final ReserveDoctorAppointmentModel? args;

  @override
  State<AppointmentRow> createState() => _AppointmentRowState();
}

class _AppointmentRowState extends State<AppointmentRow> {
  final ScrollController _controller = ScrollController();

  void _scrollRight() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _scrollLeft() {
    _controller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  bool isPressed = false;
  int selectedReservation = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: _scrollLeft,
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 24.0,
              color: ColorManger.greyRColor,
            )),
        SizedBox(
          width: 5.w,
        ),
        SizedBox(
          height: 132.h,
          width: 287.w,
            child: BlocConsumer<AddToCartCubit,AddToCartState>(
              listener: (context,state){
                sl<NavigationService>().navigateTo(Routes.cartScreen);

              },
              builder: (context,state){
                return  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  controller: _controller,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (selectedReservation !=
                          widget.docItemModel?.appointment!.appointment[index].id) {
                        AddToCartCubit.get(context).setSelected(
                            appointmentClinics: widget.docItemModel?.appointment!.appointment[index]
                        );

                        AddToCartCubit.get(context).addToCart(
                          request: AddToCartRequest(
                              branch:widget.args?.specializationId ,
                              service:widget.args?.clinic.id ,
                              appointmentId: AddToCartCubit.get(context).selectedAppointment?.id),

                        );

                        // PostDoctorReservationCubit.get(context).setSelected(
                        //     appointmentClinics: widget
                        //         .docItemModel?.appointment!.appointment[index]);
                        //
                        // PostDoctorReservationCubit.get(context)
                        //     .postDoctorReservation(
                        //         request: PostDoctorReservation(
                        //             serviceId: widget.args?.clinic.id,
                        //             appointmentsId:
                        //                 PostDoctorReservationCubit.get(context)
                        //                     .selectedAppointment
                        //                     ?.id,
                        //             specializationsId:
                        //                 widget.args?.specializationId));


                        setState(() {
                          isPressed = !isPressed;
                          selectedReservation = widget.docItemModel?.appointment!
                              .appointment[index].id ??
                              -1;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: Container(
                        width: 89.w,
                        height: 132.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: ColorManger.whiteGreyColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 37.h,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                color: ColorManger.blueColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  widget.docItemModel?.appointment
                                      ?.appointment[index].day ??
                                      '',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(color: ColorManger.whiteColor),
                                ),
                              ),
                            ),
                            Container(
                              height: 67.4.h,
                              width: 90.w,
                              color: ColorManger.whiteColor,
                              child: Column(
                                children: [
                                  Text(
                                    '${widget.docItemModel?.appointment?.appointment[index].startTime}',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: ColorManger.labelGrayColor),
                                  ),
                                  Text(
                                    StringManger.to.tr(),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: ColorManger.labelGrayColor),
                                  ),
                                  Text(
                                    '${widget.docItemModel?.appointment?.appointment[index].endTime}',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: ColorManger.labelGrayColor),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 25.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: isPressed &&
                                    selectedReservation ==
                                        widget.docItemModel?.appointment!
                                            .appointment[index].id
                                    ? ColorManger.greyLColor
                                    : ColorManger.redColor,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              child: Text(
                                StringManger.book.tr(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                    fontSize: 12.sp,
                                    color: ColorManger.whiteColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: widget.docItemModel?.appointment?.appointment.length,

                );})
                ),

                SizedBox(
                width: 5.w,
                ),
                GestureDetector(
                onTap: _scrollRight,
                child: const Icon(
                Icons.arrow_forward_ios,
                color: ColorManger.greyRColor,
                )),


      ],
    );
  }
}
