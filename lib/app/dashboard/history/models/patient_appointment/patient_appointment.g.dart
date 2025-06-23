// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAppointment _$PatientAppointmentFromJson(Map<String, dynamic> json) =>
    PatientAppointment(
      serial: (json['serial'] as num).toInt(),
      appointmentDate: json['appointmentDate'] as String,
      appointmentDateStartTime: json['appointmentDateStartTime'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      docotorId: (json['docotorId'] as num).toInt(),
      docotorJobId: (json['docotorJobId'] as num).toInt(),
      docotorNameAr: json['docotorNameAr'] as String,
      docotorNameEn: json['docotorNameEn'] as String,
      doctorJobNameAr: json['doctorJobNameAr'] as String?,
      docotorJobNameEn: json['docotorJobNameEn'] as String?,
      departmentNameAr: json['departmentNameAr'] as String,
      departmentNameEn: json['departmentNameEn'] as String,
      isCanceled: json['isCanceled'] as bool,
      clinicId: (json['clinicId'] as num).toInt(),
      appointmentAvailable: json['appointmentAvailable'] as bool,
      fkMedDoctorScheduleId: (json['fK_MedDoctorScheduleId'] as num).toInt(),
    );

Map<String, dynamic> _$PatientAppointmentToJson(PatientAppointment instance) =>
    <String, dynamic>{
      'serial': instance.serial,
      'appointmentDate': instance.appointmentDate,
      'appointmentDateStartTime': instance.appointmentDateStartTime,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'docotorId': instance.docotorId,
      'docotorJobId': instance.docotorJobId,
      'docotorNameAr': instance.docotorNameAr,
      'docotorNameEn': instance.docotorNameEn,
      'doctorJobNameAr': instance.doctorJobNameAr,
      'docotorJobNameEn': instance.docotorJobNameEn,
      'departmentNameAr': instance.departmentNameAr,
      'departmentNameEn': instance.departmentNameEn,
      'isCanceled': instance.isCanceled,
      'clinicId': instance.clinicId,
      'appointmentAvailable': instance.appointmentAvailable,
      'fK_MedDoctorScheduleId': instance.fkMedDoctorScheduleId,
    };
