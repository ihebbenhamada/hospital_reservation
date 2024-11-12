// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestDoctor _$LatestDoctorFromJson(Map<String, dynamic> json) => LatestDoctor(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      code: json['code'] as String,
      fkHrDepartmentId: (json['fk_HrDepartmentId'] as num).toInt(),
      departmentName: json['departmentName'] as String,
      jobNameAr: json['jobNameAr'] as String,
      jobNameEn: json['jobNameEn'] as String,
    );

Map<String, dynamic> _$LatestDoctorToJson(LatestDoctor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'code': instance.code,
      'fk_HrDepartmentId': instance.fkHrDepartmentId,
      'departmentName': instance.departmentName,
      'jobNameAr': instance.jobNameAr,
      'jobNameEn': instance.jobNameEn,
    };
