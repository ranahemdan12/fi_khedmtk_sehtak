import '../../../shared/statics/enum.dart';

class ConfirmLabReservation{

  final int id;
  ServiceType serviceType;

  ConfirmLabReservation({required this.id, required this.serviceType});

  Map<String, dynamic> toJson() =>
      {
        "id": id,
      };
}