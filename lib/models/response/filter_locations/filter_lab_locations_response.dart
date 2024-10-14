import '../../../shared/statics/enum.dart';
import '../labs/labs_response.dart';

class FilterLabsLocationsSuccessResponse {
  List<LabsResultsItem>? results;

  FilterLabsLocationsSuccessResponse({this.results});

  factory FilterLabsLocationsSuccessResponse.fromJson(
      {required List jsonList, required ServiceType serviceType}) {
    return FilterLabsLocationsSuccessResponse(
        results: jsonList
            .map((e) => LabsResultsItem.fromJson(e, serviceType))
            .toList());
  }
}


class FilterLabsLocationsErrorResponse {
  String? message;

  FilterLabsLocationsErrorResponse({required this.message});

  factory FilterLabsLocationsErrorResponse.fromJson(
      {required Map<String, dynamic> json}) {
    return FilterLabsLocationsErrorResponse(message: json['message']);
  }
}
