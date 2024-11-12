// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: (json['id'] as num).toInt(),
      company: json['company'] as String,
      branch: json['branch'] as String,
      patient: json['patient'] as String,
      doctor: json['doctor'] as String,
      department: json['department'] as String,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      timeFrom: json['timeFrom'] as String,
      timeTo: json['timeTo'] as String,
      isCanceled: json['isCanceled'] as bool,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'branch': instance.branch,
      'patient': instance.patient,
      'doctor': instance.doctor,
      'department': instance.department,
      'appointmentDate': instance.appointmentDate.toIso8601String(),
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
      'isCanceled': instance.isCanceled,
    };
