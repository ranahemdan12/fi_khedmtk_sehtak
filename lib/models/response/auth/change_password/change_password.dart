class ChangePasswordResponse{

  String? message;
  ChangePasswordResponse({this.message});


  factory ChangePasswordResponse.fromJson (Map<String,dynamic>json){
    return ChangePasswordResponse(

      message: json['message'],
    );


}
}


class ChangePasswordErrorResponse{

  String? message;
  ChangePasswordErrorResponse(  { required this.message});


  factory ChangePasswordErrorResponse.fromJson (Map<String,dynamic>json){
    return ChangePasswordErrorResponse(

      message: json['message'],
    );


  }
}