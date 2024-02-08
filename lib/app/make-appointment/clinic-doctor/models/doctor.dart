class Doctor {
  final int id;
  final String fullName;
  final String code;
  final String departmentName;
  final String jobNameAr;
  final String jobNameEn;
  final int fK_HrDepartmentId;

  Doctor({
    required this.id,
    required this.fullName,
    required this.code,
    required this.departmentName,
    required this.jobNameAr,
    required this.jobNameEn,
    required this.fK_HrDepartmentId,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      fullName: json['fullName'],
      code: json['code'],
      departmentName: json['departmentName'],
      jobNameAr: json['jobNameAr'],
      jobNameEn: json['jobNameEn'],
      fK_HrDepartmentId: json['fK_HrDepartmentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'code': code,
      'departmentName': departmentName,
      'jobNameAr': jobNameAr,
      'jobNameEn': jobNameEn,
      'fK_HrDepartmentId': fK_HrDepartmentId,
    };
  }
}
