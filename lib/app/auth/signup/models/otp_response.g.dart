// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPResponse _$OTPResponseFromJson(Map<String, dynamic> json) => OTPResponse(
      message: json['message'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      otp: json['otp'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$OTPResponseToJson(OTPResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
      'userId': instance.userId,
    };
