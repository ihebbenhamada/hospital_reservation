// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      medicalRegisterNo: json['medicalRegisterNo'] as String,
      birthDateGregorian: json['birthDateGregorian'] as String?,
      birthDateHajiri: json['birthDateHajiri'] as String?,
      nationality: json['nationality'] as String?,
      hawia: json['hawia'] as String,
      mobile: json['mobile'] as String,
      fKDefBranchId: (json['fK_DefBranchId'] as num).toInt(),
      branchNameAr: json['branchNameAr'] as String,
      branchNameEn: json['branchNameEn'] as String,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'medicalRegisterNo': instance.medicalRegisterNo,
      'birthDateGregorian': instance.birthDateGregorian,
      'birthDateHajiri': instance.birthDateHajiri,
      'nationality': instance.nationality,
      'hawia': instance.hawia,
      'mobile': instance.mobile,
      'fK_DefBranchId': instance.fKDefBranchId,
      'branchNameAr': instance.branchNameAr,
      'branchNameEn': instance.branchNameEn,
    };
