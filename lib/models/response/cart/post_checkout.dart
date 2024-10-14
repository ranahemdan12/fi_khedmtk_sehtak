class PostCheckOutResponse{
bool? isCash;
String? message;
double?total;

String?url;

PostCheckOutResponse({this.url,this.message,this.isCash,this.total});

factory PostCheckOutResponse.fromJson(Map<String, dynamic> jsonData) {
  return PostCheckOutResponse(
    url: jsonData['url'],
    message: jsonData['message'],
    total: jsonData['total'],
    isCash:jsonData.containsKey('message')? true : false,


  );
}


}

class PostCheckOutErrorResponse{
  String? message;

  PostCheckOutErrorResponse({this.message});

  PostCheckOutErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['detail'];
  }
}