import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/custom_screen/widget/appointment_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../shared/statics/enum.dart';



class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {


  AppointmentEnum? appointmentEnum;


  @override
  Widget build(BuildContext context) {
    return  CustomScreen(
        text: StringManger.appointment.tr(),
        body: AppointmentGridView(appointmentEnum: appointmentEnum,));

  }
}
