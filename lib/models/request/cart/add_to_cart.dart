class AddToCartRequest{
  int?branch;
  int?service;
  int?appointmentId;

  AddToCartRequest({this.branch,this.service, required this. appointmentId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> reqMap = {};
    branch != null ? reqMap.addAll({"branch": branch,}) : {};
    service!= null ? reqMap.addAll({'service':service}) : {};
    appointmentId!= null ? reqMap.addAll({'appointment':appointmentId}) : {};

    return reqMap;
  }

}