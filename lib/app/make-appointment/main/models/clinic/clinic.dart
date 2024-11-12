import 'package:json_annotation/json_annotation.dart';

part 'clinic.g.dart';

@JsonSerializable()
class Clinic {
  final int id;
  final String departmentCode;
  final String departmentNameAr;
  final String departmentNameEn;
  @JsonKey(name: 'fK_DefBranchId')
  final int fKDefBranchId;
  final String branchNameAr;
  final String branchNameEn;

  Clinic({
    this.id = 0,
    this.departmentCode = '',
    this.departmentNameAr = '',
    this.departmentNameEn = '',
    this.fKDefBranchId = 0,
    this.branchNameAr = '',
    this.branchNameEn = '',
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}
