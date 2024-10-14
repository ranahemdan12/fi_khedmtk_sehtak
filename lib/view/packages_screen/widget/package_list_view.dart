import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/view/clinic/doctor_info_in_speciality_screen/screen/doctor_info_in_speciality_screen.dart';
import 'package:fi_khedmtk_sehtak/view/custom_screen/widget/appointment_grid_view.dart';
import 'package:fi_khedmtk_sehtak/view/packages_screen/widget/package_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/service_locator.dart';
import '../package_cubit/package_cubit.dart';

class PackageListView extends StatelessWidget {
  const PackageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageCubit, PackageState>(
      builder: (context, state) {
        if (state is PackageSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              return index >= state.packageItem.length &&
                      state.packageItem.isNotEmpty
                  ? const Center(child: CustomLoadingIndicator())
                  : GestureDetector(
                      onTap: () {
                        state.packageItem[index].type == "hospital"
                            ? sl<NavigationService>()
                                .navigateTo(Routes.appointmentScreen,
                                    arguments: AppointmentArguments(
                                      appointments: state.packageItem[index]
                                              .appointment?.appointment ??[],
                                      hospitalServiceId:
                                          state.packageItem[index].id,

                                    ))
                            : state.packageItem[index].type == "doctor"
                                ? {
                                    sl<NavigationService>().navigateTo(
                                        Routes.doctorInfoInScreen,
                                        arguments:
                                            ReserveDoctorAppointmentModel(clinic: state.packageItem[index].doctor!, specializationId: state.packageItem[index].specialization??0))
                                  }
                                : sl<NavigationService>().navigateTo(
                                    Routes.appointmentScreen,
                                    arguments: AppointmentArguments(

                                      appointments: state.packageItem[index]
                                              .appointment?.appointment ??
                                          [],
                                    ));
                      },
                      child: PackageItemList(
                        packageItem: state.packageItem[index],
                      ),
                    );
            },
            itemCount: state.reachMax
                ? state.packageItem.length
                : state.packageItem.length + 1,
          );
        } else if (state is PackageLoading) {
          return const CustomSliverShimmer();
        } else if (state is PackageEmpty) {
          return SliverToBoxAdapter(
              child: Image.asset("assets/images/noData.png"));
        } else if (state is PackageError) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.message ?? '')));
        } else {
          return SliverToBoxAdapter(
              child: Center(child: Image.asset("assets/images/noData.png")));
        }
      },
    );
  }
}
