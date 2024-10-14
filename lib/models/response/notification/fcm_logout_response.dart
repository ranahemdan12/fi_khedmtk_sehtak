class FcmLogoutResponse{

  String? message;

  FcmLogoutResponse({this.message});

  factory FcmLogoutResponse.fromJson(Map<String ,dynamic>json){
    return FcmLogoutResponse(
      message: json['message'],

    );
  }

}

class FcmLogoutErrorResponse{
  String? message;

  FcmLogoutErrorResponse({this.message});

  factory FcmLogoutErrorResponse.fromJson(Map<String,dynamic>json){

    return FcmLogoutErrorResponse(
      message: json['detail'],
    );
  }

}