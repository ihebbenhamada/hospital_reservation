import 'package:json_annotation/json_annotation.dart';

part 'data_create_appointment.g.dart';

@JsonSerializable()
class DataCreateAppointment {
  int? patientId;
  int? doctorId;
  int? clinicId;
  @JsonKey(name: 'fK_MedDoctorScheduleId')
  int? fKMedDoctorScheduleId;
  @JsonKey(name: 'fK_DefBranchId')
  int? fKDefBranchId;
  String? medicalRegisterNo;
  String? appointmentDate;
  String? appointmentTimeFrom;
  String? appointmentTimeTo;
  int? appointmentNo;

  DataCreateAppointment({
    this.patientId,
    this.doctorId,
    this.clinicId,
    this.fKMedDoctorScheduleId,
    this.fKDefBranchId,
    this.medicalRegisterNo,
    this.appointmentDate,
    this.appointmentTimeFrom,
    this.appointmentTimeTo,
    this.appointmentNo,
  });

  factory DataCreateAppointment.fromJson(Map<String, dynamic> json) =>
      _$DataCreateAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$DataCreateAppointmentToJson(this);
}
