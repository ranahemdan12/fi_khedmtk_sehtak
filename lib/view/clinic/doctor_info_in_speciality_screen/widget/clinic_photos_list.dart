import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/statics/reusable_component.dart';




class ClinicPhotosList extends StatefulWidget {
  const ClinicPhotosList({super.key,required this.docItemModel});
  final ClinicsResultItem? docItemModel;

  @override
  State<ClinicPhotosList> createState() => _ClinicPhotosListState();
}

class _ClinicPhotosListState extends State<ClinicPhotosList> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 178.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child:
          CustomCachedNetworkImage(
              imageUrl: widget. docItemModel?.clinicPhotos
              ?.clinicPhotosItem[index].image ?? '',
              height:178.h, width: 267.w, borderRadius: 8,
            fit: BoxFit.cover,
          )),

        itemCount: widget.docItemModel
            ?.clinicPhotos?.clinicPhotosItem.length,
      ),
    );
  }
}
