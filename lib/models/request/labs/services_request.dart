import '../../../shared/statics/enum.dart';

class LabsServicesRequest {
  int? page;
  ServiceType? serviceType;
  final String? search;


  LabsServicesRequest({this.page, this.search,this.serviceType});



  Map<String, dynamic> toJson() {
    Map<String, dynamic> reqMap = {};
    page != null ? reqMap.addAll({"page": page,}) : {};
    search?.isNotEmpty == true ? reqMap.addAll({'search':search}) : {};

    return reqMap;
  }
}
