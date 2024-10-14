import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_services_cubit/labs_services_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/labs/widgets/lab_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../orders_screen/cubit/labs_reservation/labs_reservation_cubit.dart';
import '../cubit/labs_cubit/labs_cubit.dart';



//ignore: must_be_immutable
class ServicesList extends StatefulWidget {
  ServicesList({Key? key, this.service}) : super(key: key);
  ServiceType? service;

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabsServicesCubit, LabsServicesState>(
      builder: (context, state) {
        if (state is LabsServicesLoadedState) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              return index >= state.services.length && state.services.isNotEmpty
                  ? const Center(child: CustomLoadingIndicator())
                  : GestureDetector(
                      onTap: () {

                        LabsCubit.get(context).labsServiceModel = state.services[index];
                        LabsCubit.get(context).serviceType = LabsServicesCubit.get(context).serviceType!;
                        // LabsReservationCubit.get(context).serviceType = LabsServicesCubit.get(context).serviceType!;

                        sl<NavigationService>().navigateTo(Routes.labBranchesScreen);
                      },
                      child: LabServiceCard(
                        service: state.services[index],
                      ),
                    );
            },
            itemCount: state.reachedMax
                ? state.services.length
                : state.services.length + 1,
          );
        }
        else if (state is LabsServicesLoadingState) {
          return const CustomSliverShimmer();
        } else if (state is LabsServicesEmptyState) {
          return SliverToBoxAdapter(child: Image.asset("assets/images/noData.png"));
        } else if (state is LabsServicesErrorState) {
          return SliverToBoxAdapter(child: Center(child: Text(state.error)));
        } else {
          return SliverToBoxAdapter(child: Center(child: Image.asset("assets/images/noData.png")));
        }
      },
    );
  }
}
