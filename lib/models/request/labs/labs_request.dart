import '../../../shared/statics/constants.dart';
import '../../../shared/statics/enum.dart';

class LabsRequest {
  int? serviceId;
  int? page;
  int? city;
  int? region;
  double? maxFees;
  double? minFees;
  String? ordering;
  ServiceType serviceType;

  LabsRequest({this.serviceId, this.page,this.city,this.ordering,this.minFees,
  this.maxFees,this.region,required this.serviceType});

  Map<String, dynamic> toJson() {
    Map<String,dynamic> reqMap  = {};
    page!=null? reqMap.addAll({"page": page,}):{};
    city!=null? reqMap.addAll({"city": city,}):{};
    region!=null? reqMap.addAll({"region": region,}):{};
    maxFees!=null? reqMap.addAll({"max_examination_fees": int.parse(maxFees!.toStringAsFixed(0)),}):{};
    minFees!=null? reqMap.addAll({"min_examination_fees": int.parse(minFees!.toStringAsFixed(0)),}):{};
    ordering?.isNotEmpty == true ? reqMap.addAll({'ordering': getOrderBy(ordering ?? '')})
        : {};

    return reqMap;
  }
  getOrderBy(String ordering) {
    if (ordering == Constants.orderLabByPriceEn ||
        ordering == Constants.orderByPriceAr) {
      return Constants.orderLabByPriceEn;
    } else {
      return Constants.orderLabByPriceF;
    }
  }
}
