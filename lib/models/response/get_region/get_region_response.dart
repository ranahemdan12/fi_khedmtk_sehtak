class GetRegionResponse {
  List<RegionItem> regionItem;

  GetRegionResponse({required this.regionItem});

  factory GetRegionResponse.fromJson({required List jsonList}) {
    return GetRegionResponse(
        regionItem: jsonList.map((e) => RegionItem.fromJson(e)).toList());
  }
}

class RegionItem {
  int? id;
  String? regionName;

  int? city;

  RegionItem({ this.id,
       this.regionName,
    this.city});

  factory RegionItem.fromJson(Map<String, dynamic> json) {
    return RegionItem(
      id: json['id'],
      regionName: json['name'],
      city: json['city'],
    );
  }
}

class GetCitiesErrorResponse {
  String? message;

  GetCitiesErrorResponse({this.message});

  GetCitiesErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
