import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/models/response/clinic/make_reservation_response.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../home_screen/cubit/cart_cubit/add_to_cart_screen/add_to_cart_cubit.dart';


//ignore: must_be_immutable
class AppointmentContainer extends StatefulWidget {
  AppointmentContainer(
      {super.key,
      this.onTap,
      // this.appointmentEnum,
      required this.appointmentItem});

  void Function()? onTap;
  // AppointmentEnum? appointmentEnum;
  final AppointmentItem appointmentItem;

  @override
  State<AppointmentContainer> createState() => _AppointmentContainerState();
}

class _AppointmentContainerState extends State<AppointmentContainer> {
  MakeReservationResponse? makeReservationResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorManger.greyAppoiColor),
          borderRadius: BorderRadius.circular(8),
          color: ColorManger.greyAppoiContColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Text(
            widget.appointmentItem.day ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: ColorManger.blueColor,
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            widget.appointmentItem.date ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: ColorManger.blueColor,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            widget.appointmentItem.startTime ??
                '' '${'-'}' '${widget.appointmentItem.endTime}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorManger.labelGrayColor,
                ),
          ),
          SizedBox(
            height: 33.5.h,
          ),
          BlocConsumer<AddToCartCubit, AddToCartState>(
            listener: (context, state) {
              if (state is AddToCartSuccess) {
                sl<NavigationService>().navigateTo(Routes.cartScreen);
              }
            },
            builder: (context, state) {
              if (state is AddToCartLoading && state.id ==widget.appointmentItem.id) {
                return const CustomLoadingIndicator();
              } else {
                return GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: 177.w,
                    height: 54.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: ColorManger.blueColor,
                    ),
                    child: Center(
                      child: Text(
                        StringManger.book.tr(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: ColorManger.whiteColor),
                      ),
                    ),
                  ),
                );
              }
            },
          ),


        ],
      ),
    );
  }
}
