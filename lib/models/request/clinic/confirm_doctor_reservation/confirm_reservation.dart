class ConfirmReservationRequest{


  final int id;

  ConfirmReservationRequest({ required this.id});
  Map<String, dynamic> toJson() => {
    "id": id,
  };
}