class FcmRegisterResponse{
String? message;

FcmRegisterResponse({this.message});
factory FcmRegisterResponse.fromJson(Map<String,dynamic>json){

  return FcmRegisterResponse(
    message: json['message'],
  );
}

}



class FcmRegisterErrorResponse{

  final String message;

  FcmRegisterErrorResponse({required this.message});

  factory FcmRegisterErrorResponse.fromJson(Map<String,dynamic>json){

    return FcmRegisterErrorResponse(
        message:json['detail'],
    );
  }
}