
class GetCityResponseModel{


  List<CityItem> cityItem;

  GetCityResponseModel({required  this.cityItem});

  factory GetCityResponseModel.fromJson({required List jsonList}) {

    return GetCityResponseModel(cityItem: jsonList.map((e) => CityItem.fromJson(e)).toList());

  }

}


class CityItem {

  int? id;
  String? cityName;

  CityItem({ this.id,  this.cityName,  });

 factory CityItem.fromJson( Map<String, dynamic> json){

    return CityItem(
      id: json['id'],
      cityName: json['name'],
  );




  }
}












class GetGovernoratesErrorResponse{
  String? message;
  GetGovernoratesErrorResponse({this.message});
  GetGovernoratesErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['message'];
  }
}