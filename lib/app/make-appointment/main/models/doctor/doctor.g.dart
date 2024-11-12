// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? '',
      code: json['code'] as String? ?? '',
      fKHrDepartmentId: (json['fK_HrDepartmentId'] as num?)?.toInt() ?? 0,
      fKDefBranchId: (json['fK_DefBranchId'] as num?)?.toInt() ?? 0,
      departmentName: json['departmentName'] as String? ?? '',
      jobNameAr: json['jobNameAr'] as String? ?? '',
      jobNameEn: json['jobNameEn'] as String? ?? '',
      branchNameEn: json['branchNameEn'] as String? ?? '',
      branchNameAr: json['branchNameAr'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'code': instance.code,
      'fK_HrDepartmentId': instance.fKHrDepartmentId,
      'fK_DefBranchId': instance.fKDefBranchId,
      'departmentName': instance.departmentName,
      'jobNameAr': instance.jobNameAr,
      'jobNameEn': instance.jobNameEn,
      'branchNameAr': instance.branchNameAr,
      'branchNameEn': instance.branchNameEn,
    };
