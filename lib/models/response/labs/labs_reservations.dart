import 'package:fi_khedmtk_sehtak/models/response/labs/reserve_lab_service_response.dart';
import '../../../shared/statics/enum.dart';


class LabsReservationsSuccessResponse{
 int? count;
 String? next;
 String? previous;
 LabReservation? labServiceSuccessResponse;

 LabsReservationsSuccessResponse({this.next,this.count,this.previous,this.labServiceSuccessResponse});

 factory LabsReservationsSuccessResponse.fromJson( Map<String,dynamic> jsonData,ServiceType service) {
   return LabsReservationsSuccessResponse(
     count: jsonData['count'],
     next: jsonData['next'],
     previous: jsonData['previous'],
     labServiceSuccessResponse: LabReservation.fromJson(jsonList:jsonData ['results'],service:service )

   );
}
}
class LabReservation{
  List<ReserveLabServiceSuccessResponse> reservationItem;

  LabReservation({this.reservationItem = const []});

  factory LabReservation.fromJson({required List jsonList ,required ServiceType service}) {
    return LabReservation(
        reservationItem:
        jsonList.map((e) => ReserveLabServiceSuccessResponse.fromJson(e,service)).toList());
  }
}



class LabsReservationsErrorResponse{
  final String message;
  LabsReservationsErrorResponse({required this.message});

  factory LabsReservationsErrorResponse.fromJson({required Map<String,dynamic> json,}){
    return LabsReservationsErrorResponse(
      message: json['message'],
    );

  }

}
