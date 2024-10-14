

import '../../../shared/statics/enum.dart';

class GetReservationsRequest{

  int? page;
  ServiceType serviceType;

  GetReservationsRequest({ this.page=1,required this.serviceType});

  Map<String, dynamic> toJson() {
    Map<String,dynamic> reqMap  = {};
    page!=null? reqMap.addAll({"page": page,}):{};

    return reqMap;
  }
}