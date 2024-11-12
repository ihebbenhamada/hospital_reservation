import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String? id;
  final String hawiaNo;
  final String fullName;
  final String password;
  final String? mrn;
  final String phoneNumber;
  final String? encryptedOtp;
  final String? otp;
  final String resultMessage;
  final bool? resultStatus;
  @JsonKey(name: 'fk_DefCompanyId')
  final int fkDefCompanyId;
  @JsonKey(name: 'fk_DefBranchId')
  final int fkDefBranchId;

  SignUpResponse({
    required this.id,
    required this.hawiaNo,
    required this.fullName,
    required this.password,
    required this.mrn,
    required this.phoneNumber,
    required this.encryptedOtp,
    required this.otp,
    required this.resultMessage,
    required this.resultStatus,
    required this.fkDefCompanyId,
    required this.fkDefBranchId,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
