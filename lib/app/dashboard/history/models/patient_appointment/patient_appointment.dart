import 'package:json_annotation/json_annotation.dart';

part 'patient_appointment.g.dart';

@JsonSerializable()
class PatientAppointment {
  final int serial;
  final String appointmentDate;
  final String appointmentDateStartTime;
  final String startTime;
  final String endTime;
  final int docotorId;
  final int docotorJobId;
  final String docotorNameAr;
  final String docotorNameEn;
  final String? doctorJobNameAr;
  final String? docotorJobNameEn;
  final String departmentNameAr;
  final String departmentNameEn;
  final bool isCanceled;
  final int clinicId;
  final bool appointmentAvailable;
  @JsonKey(name: 'fK_MedDoctorScheduleId')
  final int fkMedDoctorScheduleId;

  PatientAppointment({
    required this.serial,
    required this.appointmentDate,
    required this.appointmentDateStartTime,
    required this.startTime,
    required this.endTime,
    required this.docotorId,
    required this.docotorJobId,
    required this.docotorNameAr,
    required this.docotorNameEn,
    this.doctorJobNameAr,
    this.docotorJobNameEn,
    required this.departmentNameAr,
    required this.departmentNameEn,
    required this.isCanceled,
    required this.clinicId,
    required this.appointmentAvailable,
    required this.fkMedDoctorScheduleId,
  });
  factory PatientAppointment.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentToJson(this);
}
