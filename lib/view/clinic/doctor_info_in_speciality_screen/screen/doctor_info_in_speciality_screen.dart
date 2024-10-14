import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../widget/appoinment_row.dart';
import '../widget/clinic_name.dart';
import '../widget/clinic_photos_list.dart';
import '../widget/doctor_expansion.dart';
import '../widget/doctor_info_row.dart';
import '../widget/fees_column.dart';



class ReserveDoctorAppointmentModel {
  final ClinicsResultItem clinic;
  final int specializationId;

  ReserveDoctorAppointmentModel({
    required this.clinic,
    required this.specializationId,
  });
}

class DoctorInfoInSpecialityScreen extends StatefulWidget {
  const DoctorInfoInSpecialityScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DoctorInfoInSpecialityScreen> createState() =>
      _DoctorInfoInSpecialityScreenState();
}

class _DoctorInfoInSpecialityScreenState
    extends State<DoctorInfoInSpecialityScreen> {
  ClinicsResultItem? docItemModel;
  ReserveDoctorAppointmentModel? args;
  String sub = '';


  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as ReserveDoctorAppointmentModel;
    docItemModel = args?.clinic;
    for (String element in (docItemModel?.doctor?.subSpecialization ?? [''])) {
      sub = sub + element;
    }
    super.didChangeDependencies();
  }


  bool isPressed = false;
  int selectedReservation = -1;

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.doctorInformation.tr(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 22, end: 21),
            child: Column(
              children: [
                DoctorInfoColumn(docItemModel: docItemModel,),
                DoctorExpansion(docItemModel: docItemModel,),
                ClinicName(docItemModel: docItemModel,),
                ClinicPhotosList(docItemModel: docItemModel,),
                SizedBox(height: 16.h,),
                AppointmentRow(docItemModel: docItemModel, args: args,),
                FeesColumn(docItemModel: docItemModel,),
              ],
            ),
          ),
        ));
  }
}
