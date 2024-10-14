class GetHospitalsBranchesRequest{
  int page;
  String? search;
  int? city;
  int? region;


  GetHospitalsBranchesRequest({this.page = 1, this.search, this.city,this.region});


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    city != null ? map.addAll({'city': city}) : {};
    region != null ? map.addAll({'region': region}) : {};
    page != null ? map.addAll({"page": page}) : {};
    search?.isNotEmpty == true
        ? map.addAll({'search':search})
        : {};
    return map;

  }



}