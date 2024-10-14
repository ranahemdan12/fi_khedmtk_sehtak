import 'dart:core';


class PatchProfileResponse{
  String?message;
  int?status;

  PatchProfileResponse({this.message,this.status});
  factory PatchProfileResponse.fromJson(Map<String,dynamic>json){
    return PatchProfileResponse(
      message:json['message'] ,
      status: json['status'],
    );

  }}

class PatchProfileErrorResponse{


  String? message;
  PatchProfileErrorResponse({this.message});

}



