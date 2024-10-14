import '../../../shared/statics/constants.dart';
import '../../../shared/statics/enum.dart';

class GetHospitalsServiceBranchesRequest{
  int page;
  int? branchesId;
  String? search;
  HospitalServiceEnum? serviceType;
  int? clinicServiceSpecialization;
  String?title;


  GetHospitalsServiceBranchesRequest({this.page = 1, this.search, this.clinicServiceSpecialization,this.branchesId,this.title,this.serviceType});


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    title?.isNotEmpty == true
        ? map.addAll({'services__clinic_service__clinic_title': getDoctorTitle(title ?? '')})
        : {};
    serviceType !=null? map.addAll({'service_type': getServiceType(serviceType)}) : {};
    clinicServiceSpecialization != null && serviceType== HospitalServiceEnum.clinics? map.addAll({'services__clinic_service__specialization': clinicServiceSpecialization}) : {};
    page != null ? map.addAll({"page": page}) : {};
    search?.isNotEmpty == true
        ? map.addAll({'search':search})
        : {};
    return map;

  }


  String getDoctorTitle(String title) {
    if (title == Constants.professorAr || title == Constants.professor) {
      return Constants.professor;
    } else if (title == Constants.lecturerAr || title == Constants.lecturer) {
      return Constants.lecturer;
    } else if (title == Constants.consultantAr ||
        title == Constants.consultant) {
      return Constants.consultant;
    } else {
      return Constants.specialist;
    }
  }

  String getServiceType(HospitalServiceEnum? serviceType) {
    if (serviceType == HospitalServiceEnum.labs ) {
      return Constants.labEn;
    } else if (serviceType == HospitalServiceEnum.scanners  ) {
      return Constants.scanEn;
    } else if (serviceType ==HospitalServiceEnum.clinics  ) {
      return Constants.clinicsServiceEn;
    } else {
      return Constants.operationsEn;
    }
  }
}