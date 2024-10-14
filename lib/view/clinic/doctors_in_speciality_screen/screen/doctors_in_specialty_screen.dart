import 'package:fi_khedmtk_sehtak/view/clinic/doctor_info_in_speciality_screen/screen/doctor_info_in_speciality_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/statics/navigation_service.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../doctor_filter_screen/cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../cubit/doctors_in_speciality_cubit.dart';
import '../widget/doctor_card.dart';
import '../widget/doctors_in_speciality_row.dart';
import '../widget/doctors_in_speciality_textfield.dart';



class DoctorsInSpecialityScreen extends StatefulWidget {
  const DoctorsInSpecialityScreen({Key? key, this.id}) : super(key: key);

  final int? id;

  @override
  State<DoctorsInSpecialityScreen> createState() =>
      _DoctorsInSpecialityScreenState();
}

class _DoctorsInSpecialityScreenState extends State<DoctorsInSpecialityScreen> {
  late ScrollController _scrollController;
  TextEditingController controller = TextEditingController();
  late DoctorsInSpecialityCubit doctorCubit;

  @override
  void initState() {
    doctorCubit = DoctorsInSpecialityCubit.get(context)..initializeSearch();
    doctorCubit.getClinicsInSpeciality(reset: true);

    DoctorFilterCubit.get(context).resetFilter();
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      doctorCubit.getClinicsInSpeciality();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: DoctorsInSpecialityCubit.get(context).selectedSpeciality.name!,
        body: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Column(
            children: [
              DoctorsInSpecialityTextField(
                textEditingController: controller,
                onChanged: (value) {
                  _searchDoctors(cubit: doctorCubit, page: 1, text: value);
                },
              ),
              const DoctorInfoRow(),
              SizedBox(
                height: 16.h,
              ),
              Expanded(child: BlocBuilder<DoctorsInSpecialityCubit,
                  DoctorsInSpecialityState>(
                builder: (BuildContext context, state) {
                  if (state is DoctorsInSpecialityLoading) {
                    return const CustomShimmer();
                  } else if (state is DoctorsInSpecialitySuccessState) {
                    return ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return index >= state.clinicsList.length &&
                                state.clinicsList.isNotEmpty
                            ? const CustomLoadingIndicator()
                            : GestureDetector(
                                onTap: () {
                                  sl<NavigationService>().navigateTo(
                                      Routes.doctorInfoInScreen,
                                      arguments: ReserveDoctorAppointmentModel(
                                          clinic: state.clinicsList[index],
                                          specializationId:
                                              DoctorsInSpecialityCubit.get(
                                                          context)
                                                      .selectedSpeciality
                                                      .id ??
                                                  0));
                                },
                                child: DoctorInformation(
                                    doctor: state.clinicsList[index]),
                              );
                      },
                      itemCount: state.reachedMax
                          ? state.clinicsList.length
                          : state.clinicsList.length + 1,
                    );
                  } else if (state is DoctorsInSpecialityErrorState) {
                    return Center(child: Text('${state.message}'));
                  } else {
                    return Center(
                        child: Image.asset("assets/images/noData.png"));
                  }
                },
              )),
            ],
          ),
        ));
  }

  void _searchDoctors(
      {required DoctorsInSpecialityCubit cubit,
      required int page,
      required String text}) async {
    final searchText = text;

    cubit.searchControllerChannel.sink.add({
      'searchValue': searchText,
      'searchPage': page,
    });
  }
}
