class GetClinicsBySpecialityResponse {
  int? count;
  String? next;
  String? previous;
  ResultModel? result;
  double?minSehtakFees;
  double?maxSehtakFees;


  GetClinicsBySpecialityResponse(
      {this.count, this.next, this.previous, this.result,this.maxSehtakFees,this.minSehtakFees,});

  factory GetClinicsBySpecialityResponse.fromJson(Map<String, dynamic> json) {
    return GetClinicsBySpecialityResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: ResultModel.fromJson(jsonList: json['results']),
      minSehtakFees: json['min_sehtak_fees'],
      maxSehtakFees: json['max_sehtak_fees'],

    );
  }
}

class ResultModel {
  List<ClinicsResultItem> resultItem;

  ResultModel({this.resultItem = const []});

  factory ResultModel.fromJson({required List jsonList}) {
    return ResultModel(
        resultItem: jsonList.map((e) => ClinicsResultItem.fromJson(e)).toList());
  }
}

class ClinicsResultItem {
  int? id;
  int?branch;
  String? examinationFees;
  String? sehtakFees;
  DoctorModel? doctor;
  String? city;
  String?region;
 ClinicPhotos? clinicPhotos;
  String? clinicName;
  double? followUpFees;
  double? latitude;
  double? longitude;
  AppointmentModel? appointment;
  bool?dentistry;




  ClinicsResultItem({
    this.id,
    this.doctor,
    this.clinicPhotos,
    this.clinicName,
    this.examinationFees,
    this.followUpFees,
    this.region,
    this.city,
    this.branch,
    this.latitude,
    this.longitude,
    this.sehtakFees,
    this.appointment,
    this.dentistry
  });
  factory ClinicsResultItem.fromJson(Map<String, dynamic> jsonData) {
    return ClinicsResultItem(
      id: jsonData['id'],
      doctor: DoctorModel.fromJson(jsonData['doctor']),
        clinicPhotos: jsonData ['clinic_photos']==null?null: ClinicPhotos.fromJson(jsonList:jsonData ['clinic_photos']),
      clinicName: jsonData['clinic_name'],
        branch: jsonData['branch'],
      examinationFees : jsonData['service_fee'],
      sehtakFees : jsonData['sehtak_fee'],
      followUpFees : jsonData['follow_up_fees'],
        latitude : jsonData['latitude'],
        longitude : jsonData['longitude'],
      city : jsonData['city'],
      region : jsonData['region'],
      appointment: AppointmentModel.fromJson(jsonList: jsonData['appointment']),
        dentistry: jsonData['dentistry']

    );
  }
}

class DoctorModel {
  int? id;
  UserModel? user;
   String? bio;
  String? specialization;
  List<String> subSpecialization;
  GetExperiencesModel?experiences;

  DoctorModel({
    this.id,
    this.user,
    this.bio,
    this.specialization,
    this.subSpecialization=const[],this.experiences,

  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      user:UserModel.fromJson(json['user']),
        bio: json['bio'],
        specialization: json['specialization'],
        subSpecialization: (json['subspecialization'])!=null?(json['subspecialization']as List).map( (e) => e.toString(), )
            .toList():[],
        experiences: GetExperiencesModel.fromJson(jsonList: (json['experiences'])));





  }
}


class ClinicPhotos {
  List<ClinicsPhotosItem> clinicPhotosItem;

  ClinicPhotos({this.clinicPhotosItem = const []});

  factory ClinicPhotos.fromJson({required List jsonList}) {
    return ClinicPhotos(
        clinicPhotosItem: jsonList.map((e) => ClinicsPhotosItem.fromJson(e))
            .toList());
  }
}

 class ClinicsPhotosItem {
   String? image;
   ClinicsPhotosItem({this.image});

   factory ClinicsPhotosItem.fromJson(Map<String, dynamic>json){
     return  ClinicsPhotosItem(
       image: json['image'],
     );
   }
 }

 class UserModel{
  String? firstName;
   String? image;
  UserModel({this.firstName,this.image});
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      firstName: json['first_name'],
      image: json['image'],
    );
  }

}

class AppointmentModel{

  List<AppointmentItem> appointment;

  AppointmentModel({this.appointment = const []});

  factory AppointmentModel.fromJson({required List jsonList}) {
    return AppointmentModel(
        appointment: jsonList.map((e) => AppointmentItem.fromJson(e)).toList());
  }

}

class AppointmentItem{
  int? id;
  String? day;
  String? startTime;
  String? endTime;
  int? clinic;
  String?date;
  AppointmentItem({this.id,this.clinic,this.day,this.endTime,this.startTime,this.date});
  factory AppointmentItem.fromJson(Map<String, dynamic> jsonData,) {
    return AppointmentItem(
      id: jsonData['id'],
      day: jsonData['day'],
      startTime: jsonData['start_time'],
      endTime: jsonData['end_time'],
      clinic: jsonData['clinic'],
      date: jsonData['next_date'],


    );




        }}

class GetExperiencesModel {
  List<ExperiencesItem> experiencesItem;

  GetExperiencesModel({this.experiencesItem = const []});

  factory GetExperiencesModel.fromJson({required List jsonList}) {
    return GetExperiencesModel(
        experiencesItem:
            jsonList.map((e) => ExperiencesItem.fromJson(e)).toList());
  }
}

class ExperiencesItem {
  int? id;
  int? doctor;
  String? job;
  String? addressOfJob;
  String? jobTitle;
  String? entity;
  bool? workingStatus;
  String? startTime;
  String? endTime;

  ExperiencesItem({
    this.id,
    this.doctor,
    this.job,
    this.addressOfJob,
    this.jobTitle,
    this.entity,
    this.workingStatus,
    this.startTime,
    this.endTime,
  });

  factory ExperiencesItem.fromJson(Map<String, dynamic> json) {
    return ExperiencesItem(
      id:json['id'],
      doctor: json['doctor'],
      job: json['job'],
      addressOfJob: json['address_of_job'],
      jobTitle: json['job_title'],
      entity: json['entity'],
      workingStatus: json['working_status'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}

class GetClinicsBySpecialityErrorResponse {
  String? message;

  GetClinicsBySpecialityErrorResponse({this.message});

  GetClinicsBySpecialityErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
