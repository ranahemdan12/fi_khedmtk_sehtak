class SpecializationSuccessResponseModel{
  List<SpecializationResponseModel> categories;

  SpecializationSuccessResponseModel({required this.categories});

  factory SpecializationSuccessResponseModel.fromJson({required List categories}){
    return SpecializationSuccessResponseModel(categories: categories.map((e)=>
        SpecializationResponseModel.fromJson(e)).toList());
  }

}


class SpecializationResponseModel{
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  String? icon;
  bool? isDentist;
  SpecializationResponseModel({this.icon,this.id, this.name,this.nameAr,this.nameEn,this.isDentist});
  SpecializationResponseModel.fromJson(Map<String, dynamic> json){
    id= json['id'];
    name= json['name'];
    icon= json['icon'];
    nameEn= json['name_en'];
    nameAr= json['name_ar'];
    isDentist= json['dentistry'];
  }
}



class SpecializationErrorResponse{
  String? message;
  SpecializationErrorResponse({this.message});
  SpecializationErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['message'];
  }
}