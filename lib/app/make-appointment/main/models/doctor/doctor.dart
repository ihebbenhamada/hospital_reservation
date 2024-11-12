import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final int id;
  final String fullName;
  final String code;
  @JsonKey(name: 'fK_HrDepartmentId')
  final int fKHrDepartmentId;
  @JsonKey(name: 'fK_DefBranchId')
  final int fKDefBranchId;
  final String departmentName;
  final String jobNameAr;
  final String jobNameEn;
  final String branchNameAr;
  final String branchNameEn;

  Doctor({
    this.id = 0,
    this.fullName = '',
    this.code = '',
    this.fKHrDepartmentId = 0,
    this.fKDefBranchId = 0,
    this.departmentName = '',
    this.jobNameAr = '',
    this.jobNameEn = '',
    this.branchNameEn = '',
    this.branchNameAr = '',
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
