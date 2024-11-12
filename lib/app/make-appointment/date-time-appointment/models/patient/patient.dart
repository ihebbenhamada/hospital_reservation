import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  final int id;
  final String fullName;
  final String medicalRegisterNo;
  final String? birthDateGregorian;
  final String? birthDateHajiri;
  final String? nationality;
  final String hawia;
  final String mobile;
  @JsonKey(name: 'fK_DefBranchId')
  final int fKDefBranchId;
  final String branchNameAr;
  final String branchNameEn;

  Patient({
    required this.id,
    required this.fullName,
    required this.medicalRegisterNo,
    required this.birthDateGregorian,
    required this.birthDateHajiri,
    required this.nationality,
    required this.hawia,
    required this.mobile,
    required this.fKDefBranchId,
    required this.branchNameAr,
    required this.branchNameEn,
  });
  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
