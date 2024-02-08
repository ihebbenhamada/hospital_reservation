class Clinic {
  final int id;
  final String departmentCode;
  final String departmentNameAr;
  final String departmentNameEn;

  Clinic({
    required this.id,
    required this.departmentCode,
    required this.departmentNameAr,
    required this.departmentNameEn,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      departmentCode: json['departmentCode'],
      departmentNameAr: json['departmentNameAr'],
      departmentNameEn: json['departmentNameEn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departmentCode': departmentCode,
      'departmentNameAr': departmentNameAr,
      'departmentNameEn': departmentNameEn,
    };
  }
}
