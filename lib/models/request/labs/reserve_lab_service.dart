import '../../../shared/statics/enum.dart';

class ReserveLabServiceRequest{
  ServiceType serviceType;
  int? labServiceId;
  int? serviceId;
  int?appointmentId;
 // int? branchId;
  ReserveLabServiceRequest({ this.labServiceId,this.serviceId,required this.serviceType,this.appointmentId});

}