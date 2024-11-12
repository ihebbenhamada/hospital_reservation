import 'package:json_annotation/json_annotation.dart';

import '../latest_doctor/latest_doctor.dart';
import '../patient_appointment/patient_appointment.dart';

part 'patient_appointments.g.dart';

@JsonSerializable()
class PatientAppointments {
  final List<PatientAppointment> patientAppointments;
  final List<LatestDoctor> latestDoctors;

  PatientAppointments({
    required this.patientAppointments,
    required this.latestDoctors,
  });

  factory PatientAppointments.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentsFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentsToJson(this);
}
