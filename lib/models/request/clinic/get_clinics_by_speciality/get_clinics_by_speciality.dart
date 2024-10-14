import 'package:fi_khedmtk_sehtak/shared/statics/constants.dart';

class GetClinicsBySpecialityRequest {
  int page;
  int? id;
  int? city;
  String? gender;
  String? title;
  int? region;
  List<int> subSpecialization;
  double? minFees;
  double? maxFees;
  String? orderBy;
  String? search;

  GetClinicsBySpecialityRequest(
      {this.id,
      this.city,
      this.subSpecialization = const [],
      this.title,
      this.gender,
      this.region,
      this.maxFees,
      this.minFees,
      this.orderBy,
      this.search,
      this.page = 1});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    city != null ? map.addAll({'branch__city': city}) : {};
    gender?.isNotEmpty == true
        ? map.addAll({'gender': getDoctorGender(gender ?? '')})
        : {};
    title?.isNotEmpty == true
        ? map.addAll({'title': getDoctorTitle(title ?? '')})
        : {};
    region != null ? map.addAll({'branch__region': region}) : {};

    subSpecialization.isNotEmpty
        ? subSpecialization.forEach(
            (element) {
              map.addAll({"subspecialization": element});
            },
          )
        : {};
    minFees != null ? map.addAll({'min_examination_fees': minFees}) : {};
    maxFees != null ? map.addAll({'max_examination_fees': maxFees}) : {};
    orderBy?.isNotEmpty == true
        ? map.addAll({'ordering': getOrderBy(orderBy ?? '')})
        : {};
    search?.isNotEmpty == true
        ? map.addAll({'search':search})
        : {};
    page != null ? map.addAll({"page": page}) : {};
    return map;
  }

  getOrderBy(String orderBy) {
    if (orderBy == Constants.orderByPriceEn ||
        orderBy == Constants.orderByPriceAr) {
      return Constants.orderByPriceEn;
    } else {
      return Constants.orderByReviewEn;
    }
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

  String getDoctorGender(String gender) {
    if (gender == Constants.maleAr || gender == Constants.male) {
      return Constants.male;
    } else {
      return Constants.female;
    }
  }
}
