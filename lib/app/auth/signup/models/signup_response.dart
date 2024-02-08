class SignUpResponse {
  final int patientId;
  final String medicalRegisterNo;
  final String fullName;
  final String gender;
  final String hawia;
  final String mobile;

  SignUpResponse({
    required this.patientId,
    required this.medicalRegisterNo,
    required this.fullName,
    required this.gender,
    required this.hawia,
    required this.mobile,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      patientId: json['patientId'],
      medicalRegisterNo: json['medicalRegisterNo'],
      fullName: json['fullName'],
      gender: json['gender'],
      hawia: json['hawia'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'medicalRegisterNo': medicalRegisterNo,
      'fullName': fullName,
      'gender': gender,
      'hawia': hawia,
      'mobile': mobile,
    };
  }
}
