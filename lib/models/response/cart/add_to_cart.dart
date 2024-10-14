


class AddToCartErrorResponse{
  String? message;

  AddToCartErrorResponse({this.message});

  AddToCartErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['detail'];
  }
}