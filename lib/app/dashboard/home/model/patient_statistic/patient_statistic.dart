import 'package:json_annotation/json_annotation.dart';

import '../appointment/appointment.dart';
import '../top_doctor/top_doctor.dart';

part 'patient_statistic.g.dart';

@JsonSerializable()
class PatientStatistics {
  final String mrn;
  final String name;
  final String patientImage;
  final int numOfAppointments;
  final int numOfPending;
  final int numOfCanceled;
  final List<Appointment> allAppointments;
  final List<Appointment> pendingAppointments;
  final List<Appointment> canceledAppointments;
  final List<TopDoctor> topDoctorsToday;
  final List<TopDoctor> topDoctorsThisWeek;
  final List<TopDoctor> topDoctorsThisMonth;

  PatientStatistics({
    this.mrn = '',
    this.name = '',
    this.patientImage = '',
    this.numOfAppointments = 0,
    this.numOfPending = 0,
    this.numOfCanceled = 0,
    this.allAppointments = const [],
    this.pendingAppointments = const [],
    this.canceledAppointments = const [],
    this.topDoctorsToday = const [],
    this.topDoctorsThisWeek = const [],
    this.topDoctorsThisMonth = const [],
  });

  factory PatientStatistics.fromJson(Map<String, dynamic> json) =>
      _$PatientStatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$PatientStatisticsToJson(this);
}
