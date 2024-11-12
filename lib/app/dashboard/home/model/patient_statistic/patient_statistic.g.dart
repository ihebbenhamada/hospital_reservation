// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientStatistics _$PatientStatisticsFromJson(Map<String, dynamic> json) =>
    PatientStatistics(
      mrn: json['mrn'] as String? ?? '',
      name: json['name'] as String? ?? '',
      patientImage: json['patientImage'] as String? ?? '',
      numOfAppointments: (json['numOfAppointments'] as num?)?.toInt() ?? 0,
      numOfPending: (json['numOfPending'] as num?)?.toInt() ?? 0,
      numOfCanceled: (json['numOfCanceled'] as num?)?.toInt() ?? 0,
      allAppointments: (json['allAppointments'] as List<dynamic>?)
              ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pendingAppointments: (json['pendingAppointments'] as List<dynamic>?)
              ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      canceledAppointments: (json['canceledAppointments'] as List<dynamic>?)
              ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topDoctorsToday: (json['topDoctorsToday'] as List<dynamic>?)
              ?.map((e) => TopDoctor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topDoctorsThisWeek: (json['topDoctorsThisWeek'] as List<dynamic>?)
              ?.map((e) => TopDoctor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topDoctorsThisMonth: (json['topDoctorsThisMonth'] as List<dynamic>?)
              ?.map((e) => TopDoctor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PatientStatisticsToJson(PatientStatistics instance) =>
    <String, dynamic>{
      'mrn': instance.mrn,
      'name': instance.name,
      'patientImage': instance.patientImage,
      'numOfAppointments': instance.numOfAppointments,
      'numOfPending': instance.numOfPending,
      'numOfCanceled': instance.numOfCanceled,
      'allAppointments': instance.allAppointments,
      'pendingAppointments': instance.pendingAppointments,
      'canceledAppointments': instance.canceledAppointments,
      'topDoctorsToday': instance.topDoctorsToday,
      'topDoctorsThisWeek': instance.topDoctorsThisWeek,
      'topDoctorsThisMonth': instance.topDoctorsThisMonth,
    };
