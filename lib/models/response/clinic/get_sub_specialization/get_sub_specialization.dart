


class GetSubSpecializationModel{
  List<SubSpecializationItem> subCategories;
  GetSubSpecializationModel({required this.subCategories});
  factory GetSubSpecializationModel.fromJson({required List subCategories}){
    return GetSubSpecializationModel(
      subCategories: subCategories.map((e) => SubSpecializationItem.fromJson(e)).toList()
    );
  }
}

class SubSpecializationItem{
  int? id;
  String? name;
  int? specialization;
  SubSpecializationItem({this.id, this.name, this.specialization});
  SubSpecializationItem.fromJson(Map<String, dynamic> json){
    id= json['id'];
    name= json['name'];
    specialization= json['specialization'];
  }
}
class SubSpecializationErrorResponse{
  String? message;
  SubSpecializationErrorResponse({this.message});
  SubSpecializationErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['message'];
  }
}