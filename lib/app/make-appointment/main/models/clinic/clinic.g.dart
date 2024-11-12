// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) => Clinic(
      id: (json['id'] as num?)?.toInt() ?? 0,
      departmentCode: json['departmentCode'] as String? ?? '',
      departmentNameAr: json['departmentNameAr'] as String? ?? '',
      departmentNameEn: json['departmentNameEn'] as String? ?? '',
      fKDefBranchId: (json['fK_DefBranchId'] as num?)?.toInt() ?? 0,
      branchNameAr: json['branchNameAr'] as String? ?? '',
      branchNameEn: json['branchNameEn'] as String? ?? '',
    );

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'id': instance.id,
      'departmentCode': instance.departmentCode,
      'departmentNameAr': instance.departmentNameAr,
      'departmentNameEn': instance.departmentNameEn,
      'fK_DefBranchId': instance.fKDefBranchId,
      'branchNameAr': instance.branchNameAr,
      'branchNameEn': instance.branchNameEn,
    };
