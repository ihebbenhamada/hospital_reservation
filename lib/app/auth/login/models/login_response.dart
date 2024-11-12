import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String resultMessage;
  final String userName;
  final String hawiaNo;
  @JsonKey(name: 'fK_HrEmployeeId')
  final int fKHrEmployeeId;
  final bool isAuthenticated;
  final String phoneNumber;
  final String token;
  final String refreshTokenExpiration;

  LoginResponse({
    this.resultMessage = '',
    this.userName = '',
    this.hawiaNo = '',
    this.fKHrEmployeeId = 0,
    this.isAuthenticated = false,
    this.phoneNumber = '',
    this.token = '',
    this.refreshTokenExpiration = '',
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
