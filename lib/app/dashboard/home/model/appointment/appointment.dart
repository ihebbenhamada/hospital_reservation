import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  final int id;
  final String company;
  final String branch;
  final String patient;
  final String doctor;
  final String department;
  final DateTime appointmentDate;
  final String timeFrom;
  final String timeTo;
  final bool isCanceled;

  Appointment({
    required this.id,
    required this.company,
    required this.branch,
    required this.patient,
    required this.doctor,
    required this.department,
    required this.appointmentDate,
    required this.timeFrom,
    required this.timeTo,
    required this.isCanceled,
  });
  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
