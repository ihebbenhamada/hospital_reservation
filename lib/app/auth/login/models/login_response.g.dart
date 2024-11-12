// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      resultMessage: json['resultMessage'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      hawiaNo: json['hawiaNo'] as String? ?? '',
      fKHrEmployeeId: (json['fK_HrEmployeeId'] as num?)?.toInt() ?? 0,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      token: json['token'] as String? ?? '',
      refreshTokenExpiration: json['refreshTokenExpiration'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'resultMessage': instance.resultMessage,
      'userName': instance.userName,
      'hawiaNo': instance.hawiaNo,
      'fK_HrEmployeeId': instance.fKHrEmployeeId,
      'isAuthenticated': instance.isAuthenticated,
      'phoneNumber': instance.phoneNumber,
      'token': instance.token,
      'refreshTokenExpiration': instance.refreshTokenExpiration,
    };
