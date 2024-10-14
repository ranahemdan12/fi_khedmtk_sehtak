import 'package:fi_khedmtk_sehtak/models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/cart_cubit/add_to_cart_screen/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import '../../../models/request/cart/add_to_cart.dart';
import '../../../shared/statics/enum.dart';
import '../../labs/cubit/labs_cubit/labs_cubit.dart';
import 'appointment_container.dart';

class AppointmentArguments {
  // final AppointmentEnum appointmentEnum;
  List<AppointmentItem> appointments;
  int? hospitalServiceId;
  int? labServiceId;
  ServiceType? type;

  AppointmentArguments(
      /*this.appointmentEnum,*/
      {this.appointments = const [],
      this.hospitalServiceId,
      this.labServiceId,
      this.type});
}

class AppointmentGridView extends StatefulWidget {
  const AppointmentGridView({
    super.key,
    required appointmentEnum,
  });

  @override
  State<AppointmentGridView> createState() => _AppointmentGridViewState();
}

class _AppointmentGridViewState extends State<AppointmentGridView> {
  AppointmentEnum? appointmentEnum;
  List<AppointmentItem> appointments = [];
  late AppointmentArguments arguments;

  @override
  void didChangeDependencies() {
    arguments =
        ModalRoute.of(context)!.settings.arguments as AppointmentArguments;
    appointments = arguments.appointments;
    // appointmentEnum = arguments.hospitalServiceId != null
    //     ? AppointmentEnum.hospitals
    //     : LabsCubit.get(context).serviceType == ServiceType.scan
    //         ? AppointmentEnum.scan
    //         : LabsCubit.get(context).serviceType == ServiceType.lab
    //             ? AppointmentEnum.labs
    //             : AppointmentEnum.physical;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 13, top: 25),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 177 / 158,
          crossAxisSpacing: 10,
          mainAxisSpacing: 11,
        ),
        itemBuilder: (context, index) {
          if (appointments.isNotEmpty) {
            return AppointmentContainer(

              appointmentItem: appointments[index],
              onTap: () {
                arguments.hospitalServiceId != null
                    ? AddToCartCubit.get(context).addToCart(
                        request: AddToCartRequest(
                        service:arguments.hospitalServiceId,
                        appointmentId: appointments[index].id ?? 0,
                        branch:
                          appointments[index].clinic ?? 0,
                      ))
                    : AddToCartCubit.get(context).addToCart(
                        request: AddToCartRequest(
                        appointmentId: appointments[index].id ?? 0,
                        branch: LabsCubit.get(context).labsServiceModel?.id ?? 0,
                        service: arguments.labServiceId ?? 0
                            ,
                      )


                        );
              },
            );
          } else {
            return Container(); // Or some fallback UI
          }
        },
        itemCount: appointments.length,
      ),
    );
  }
}
