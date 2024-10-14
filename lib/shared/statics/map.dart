import 'package:easy_localization/easy_localization.dart';
import '../resources/strings_manger.dart';
import 'enum.dart';


 Map<MapTypeEnum,String> mapTypeTitle = {
  MapTypeEnum.labs:StringManger.labs.tr(),
  MapTypeEnum.scan:StringManger.scans.tr(),
  MapTypeEnum.hospitals:StringManger.hospitals.tr(),
  MapTypeEnum.physical:StringManger.physicalTherapy.tr(),
  MapTypeEnum.pharmacy:StringManger.pharmacy.tr(),
};

 Map<ReserveOrderTypeEnum,int> orderTabBar = {

  ReserveOrderTypeEnum.bottomNav:0,
  ReserveOrderTypeEnum.doctors:0,
  ReserveOrderTypeEnum.hospitals:1,
  ReserveOrderTypeEnum.labs:2,
  ReserveOrderTypeEnum.physical:3,
  ReserveOrderTypeEnum.scan:4,

};