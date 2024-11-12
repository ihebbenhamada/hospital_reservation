import 'package:json_annotation/json_annotation.dart';

part 'create_appointment_response.g.dart';

@JsonSerializable()
class CreateAppointmentResponse {
  final int appointmentId;
  final String patientFullName;
  final String doctorName;
  final String clinicName;
  final String medicalRegisterNo;
  final DateTime appointmentDate;
  final String appointmentTimeFrom;
  final String appointmentTimeTo;
  final int appointmentNo;
  final bool isInserted;
  final String resultMessage;
  @JsonKey(name: 'fK_MedDoctorScheduleId')
  final dynamic fKMedDoctorScheduleId;

  CreateAppointmentResponse({
    required this.appointmentId,
    required this.patientFullName,
    required this.doctorName,
    required this.clinicName,
    required this.medicalRegisterNo,
    required this.appointmentDate,
    required this.appointmentTimeFrom,
    required this.appointmentTimeTo,
    required this.appointmentNo,
    required this.isInserted,
    required this.resultMessage,
    required this.fKMedDoctorScheduleId,
  });

  factory CreateAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAppointmentResponseToJson(this);
}
