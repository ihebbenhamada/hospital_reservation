import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OTPResponse {
  final String? message;
  final String? phoneNumber;
  final String? otp;
  final String? userId;

  OTPResponse({
    this.message,
    this.phoneNumber,
    this.otp,
    this.userId,
  });

  factory OTPResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OTPResponseToJson(this);
}
