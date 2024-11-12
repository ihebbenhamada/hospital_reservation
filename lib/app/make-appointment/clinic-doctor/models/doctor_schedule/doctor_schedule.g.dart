// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSchedule _$DoctorScheduleFromJson(Map<String, dynamic> json) =>
    DoctorSchedule(
      serial: (json['serial'] as num?)?.toInt() ?? 0,
      appointmentDate: json['appointmentDate'] as String? ?? '',
      appointmentAvailable: json['appointmentAvailable'] as bool? ?? false,
      appointmentDateStartTime:
          json['appointmentDateStartTime'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      docotorId: (json['docotorId'] as num?)?.toInt() ?? 0,
      clinicId: (json['clinicId'] as num?)?.toInt() ?? 0,
      fKMedDoctorScheduleId:
          (json['fK_MedDoctorScheduleId'] as num?)?.toInt() ?? 0,
      fKDefBranchId: (json['fK_DefBranchId'] as num?)?.toInt() ?? 0,
      branchNameAr: json['branchNameAr'] as String? ?? '',
      branchNameEn: json['branchNameEn'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorScheduleToJson(DoctorSchedule instance) =>
    <String, dynamic>{
      'serial': instance.serial,
      'appointmentDate': instance.appointmentDate,
      'appointmentDateStartTime': instance.appointmentDateStartTime,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'docotorId': instance.docotorId,
      'clinicId': instance.clinicId,
      'appointmentAvailable': instance.appointmentAvailable,
      'fK_MedDoctorScheduleId': instance.fKMedDoctorScheduleId,
      'fK_DefBranchId': instance.fKDefBranchId,
      'branchNameAr': instance.branchNameAr,
      'branchNameEn': instance.branchNameEn,
    };
