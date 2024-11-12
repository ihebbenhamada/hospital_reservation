// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_create_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCreateAppointment _$DataCreateAppointmentFromJson(
        Map<String, dynamic> json) =>
    DataCreateAppointment(
      patientId: (json['patientId'] as num?)?.toInt(),
      doctorId: (json['doctorId'] as num?)?.toInt(),
      clinicId: (json['clinicId'] as num?)?.toInt(),
      fKMedDoctorScheduleId: (json['fK_MedDoctorScheduleId'] as num?)?.toInt(),
      fKDefBranchId: (json['fK_DefBranchId'] as num?)?.toInt(),
      medicalRegisterNo: json['medicalRegisterNo'] as String?,
      appointmentDate: json['appointmentDate'] as String?,
      appointmentTimeFrom: json['appointmentTimeFrom'] as String?,
      appointmentTimeTo: json['appointmentTimeTo'] as String?,
      appointmentNo: (json['appointmentNo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataCreateAppointmentToJson(
        DataCreateAppointment instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'doctorId': instance.doctorId,
      'clinicId': instance.clinicId,
      'fK_MedDoctorScheduleId': instance.fKMedDoctorScheduleId,
      'fK_DefBranchId': instance.fKDefBranchId,
      'medicalRegisterNo': instance.medicalRegisterNo,
      'appointmentDate': instance.appointmentDate,
      'appointmentTimeFrom': instance.appointmentTimeFrom,
      'appointmentTimeTo': instance.appointmentTimeTo,
      'appointmentNo': instance.appointmentNo,
    };
