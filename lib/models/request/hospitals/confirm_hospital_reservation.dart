class ConfirmHospitalReservationRequest{
  final int id;

  ConfirmHospitalReservationRequest({ required this.id});

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}