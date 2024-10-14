

class GetAdsSuccessResponseModel{
  int? count;
  String? next;
  String? previous;
  AdsResult? result;

  GetAdsSuccessResponseModel(
      {this.count, this.next, this.previous, this.result});

  factory GetAdsSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAdsSuccessResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: AdsResult.fromJson( jsonList:json['results'],),
    );
  }
}


class AdsResult{
  List<AdsModelItem>results;

  AdsResult({ this.results = const []});

  factory AdsResult.fromJson({ required List jsonList}){

    return AdsResult(
        results: jsonList.map((e)=>
        AdsModelItem.fromJson(e)).toList());}}




class AdsModelItem{
  int? id;
  String? image;
  String? title;
  bool? isPublished;
  AdsModelItem({
    this.id,
    this.image,
    this.title,
    this.isPublished
  });
  AdsModelItem.fromJson(Map<String, dynamic> json){
    id= json['id'];
    image= json['img'];
    title= json['title'];
    isPublished= json['is_published'];
  }
}



class GetAdsErrorResponse{
   String? message;
  GetAdsErrorResponse({this.message});
  GetAdsErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['message'];
  }
}