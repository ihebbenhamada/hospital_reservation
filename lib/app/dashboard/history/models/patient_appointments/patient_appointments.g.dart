// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_appointments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAppointments _$PatientAppointmentsFromJson(Map<String, dynamic> json) =>
    PatientAppointments(
      patientAppointments: (json['patientAppointments'] as List<dynamic>)
          .map((e) => PatientAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestDoctors: (json['latestDoctors'] as List<dynamic>)
          .map((e) => LatestDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientAppointmentsToJson(
        PatientAppointments instance) =>
    <String, dynamic>{
      'patientAppointments': instance.patientAppointments,
      'latestDoctors': instance.latestDoctors,
    };
