
class GetContactUsResponse {
  int? id;
  String?phone;
  String?address;
  String?email;
  String?facebook;
  String?twitter;
  String?instagram;
  String?createdAt;





  GetContactUsResponse({this.id,this.address,this.phone,this.email,this.createdAt,this.facebook,this.instagram,this.twitter});


  factory GetContactUsResponse.fromJson(Map<String, dynamic> jsonData) {
    return GetContactUsResponse(
        id: jsonData['id'],
      phone: jsonData['phone'],
      address: jsonData['address'],
      email: jsonData['email'],
      facebook: jsonData['facebook'],
      twitter: jsonData['twitter'],
      instagram: jsonData['instagram'],
      createdAt: jsonData['created_at'],



    );
  }
}

class GetContactUsErrorResponse{
  String? message;
  GetContactUsErrorResponse({this.message});
  GetContactUsErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['message'];
  }
}