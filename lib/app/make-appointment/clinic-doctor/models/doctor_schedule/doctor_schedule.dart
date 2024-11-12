import 'package:json_annotation/json_annotation.dart';

part 'doctor_schedule.g.dart';

@JsonSerializable()
class DoctorSchedule {
  final int serial;
  final String appointmentDate;
  final String appointmentDateStartTime;
  final String startTime;
  final String endTime;
  final int docotorId;
  final int clinicId;
  final bool appointmentAvailable;
  @JsonKey(name: 'fK_MedDoctorScheduleId')
  final int fKMedDoctorScheduleId;
  @JsonKey(name: 'fK_DefBranchId')
  final int fKDefBranchId;
  final String branchNameAr;
  final String branchNameEn;

  DoctorSchedule({
    this.serial = 0,
    this.appointmentDate = '',
    this.appointmentAvailable = false,
    this.appointmentDateStartTime = '',
    this.startTime = '',
    this.endTime = '',
    this.docotorId = 0,
    this.clinicId = 0,
    this.fKMedDoctorScheduleId = 0,
    this.fKDefBranchId = 0,
    this.branchNameAr = '',
    this.branchNameEn = '',
  });

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) =>
      _$DoctorScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorScheduleToJson(this);
}
