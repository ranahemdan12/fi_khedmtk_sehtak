

// class GetAboutUsResponse {
//   List<AboutResultItem> resultItem;
//
//   GetAboutUsResponse({this.resultItem = const []});
//
//   factory GetAboutUsResponse.fromJson({required List jsonList}) {
//     return GetAboutUsResponse(
//         resultItem: jsonList.map((e) => AboutResultItem.fromJson(e)).toList());
//   }
// }

class GetAboutUsResponse {
  int? id;
  String?about;
  String?privacy;






  GetAboutUsResponse({this.id,this.about,this.privacy,});


  factory GetAboutUsResponse.fromJson(Map<String, dynamic> jsonData) {
    return GetAboutUsResponse(
      id: jsonData['id'],
      about: jsonData['about_us'],
      privacy: jsonData['privacy_policy'],



    );
  }
}

class GetAboutUsErrorResponse{
  String? message;
  GetAboutUsErrorResponse({this.message});
  GetAboutUsErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['message'];
  }
}