// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      id: json['id'] as String?,
      hawiaNo: json['hawiaNo'] as String,
      fullName: json['fullName'] as String,
      password: json['password'] as String,
      mrn: json['mrn'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      encryptedOtp: json['encryptedOtp'] as String?,
      otp: json['otp'] as String?,
      resultMessage: json['resultMessage'] as String,
      resultStatus: json['resultStatus'] as bool?,
      fkDefCompanyId: (json['fk_DefCompanyId'] as num).toInt(),
      fkDefBranchId: (json['fk_DefBranchId'] as num).toInt(),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hawiaNo': instance.hawiaNo,
      'fullName': instance.fullName,
      'password': instance.password,
      'mrn': instance.mrn,
      'phoneNumber': instance.phoneNumber,
      'encryptedOtp': instance.encryptedOtp,
      'otp': instance.otp,
      'resultMessage': instance.resultMessage,
      'resultStatus': instance.resultStatus,
      'fk_DefCompanyId': instance.fkDefCompanyId,
      'fk_DefBranchId': instance.fkDefBranchId,
    };
