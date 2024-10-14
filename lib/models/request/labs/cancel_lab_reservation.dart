import '../../../shared/statics/enum.dart';

class CancelReservationRequest {
  final int id;
  ServiceType serviceType;

  CancelReservationRequest({required this.id, required this.serviceType});

  Map<String, dynamic> toJson() =>
      {
        "id": id,
      };
}