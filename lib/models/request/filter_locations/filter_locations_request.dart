import '../../../shared/statics/enum.dart';


class FilterLocationsRequest {
  double? lat;
  double? long;
  int? specializationId;
  String? search;
  int? serviceId;
  int? city;
  int? region;
  ServiceType? serviceType;

  FilterLocationsRequest(
      {this.lat,
      this.long,
      this.serviceType,
      this.specializationId,
        this.serviceId,
      this.search,
      this.region,
      this.city});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    if (lat != null && search?.isNotEmpty != true) {
      map.addAll({'latitude': lat});
    }
    if (long != null && search?.isNotEmpty != true) {
      map.addAll({'longitude': long});
    }
    city != null ? map.addAll({'city': city}) : {};
    region != null ? map.addAll({'region': region}) : {};
    specializationId!= null ? map.addAll({'specialization_id': specializationId}) : {};
    search?.isNotEmpty == true ? map.addAll({'search': search}) : {};
    if(serviceId!=null) map.addAll({'service_id':serviceId});
    return map;
  }


}
