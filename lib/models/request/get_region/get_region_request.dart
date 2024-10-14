import '../../response/get_citiy/get_city_response.dart';

class GetRegionReqModel {

  CityItem governoratesItem;

  GetRegionReqModel ({required this.governoratesItem});

  Map<String, dynamic> toJson() =>
      {
        'governorate_id': governoratesItem.id,
      };
}