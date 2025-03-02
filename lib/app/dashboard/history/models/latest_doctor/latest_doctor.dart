import 'package:json_annotation/json_annotation.dart';

part 'latest_doctor.g.dart';

@JsonSerializable()
class LatestDoctor {
  final int id;
  final String fullName;
  final String code;
  @JsonKey(name: 'fK_HrDepartmentId')
  final int fkHrDepartmentId;
  final String departmentName;
  final String jobNameAr;
  final String jobNameEn;

  LatestDoctor({
    required this.id,
    required this.fullName,
    required this.code,
    required this.fkHrDepartmentId,
    required this.departmentName,
    required this.jobNameAr,
    required this.jobNameEn,
  });

  factory LatestDoctor.fromJson(Map<String, dynamic> json) =>
      _$LatestDoctorFromJson(json);

  Map<String, dynamic> toJson() => _$LatestDoctorToJson(this);
}
