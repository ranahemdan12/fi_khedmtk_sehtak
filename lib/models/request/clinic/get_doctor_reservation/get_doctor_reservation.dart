class GetDoctorReservationRequest{

  int?page;

  GetDoctorReservationRequest({this.page= 1});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    page != null ? map.addAll({"page": page}) : {};
    return map;

  }
}