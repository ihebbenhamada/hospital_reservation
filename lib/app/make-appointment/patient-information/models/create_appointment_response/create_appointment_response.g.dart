// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppointmentResponse _$CreateAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentResponse(
      appointmentId: (json['appointmentId'] as num).toInt(),
      patientFullName: json['patientFullName'] as String,
      doctorName: json['doctorName'] as String,
      clinicName: json['clinicName'] as String,
      medicalRegisterNo: json['medicalRegisterNo'] as String,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      appointmentTimeFrom: json['appointmentTimeFrom'] as String,
      appointmentTimeTo: json['appointmentTimeTo'] as String,
      appointmentNo: (json['appointmentNo'] as num).toInt(),
      isInserted: json['isInserted'] as bool,
      resultMessage: json['resultMessage'] as String,
      fKMedDoctorScheduleId: json['fK_MedDoctorScheduleId'],
    );

Map<String, dynamic> _$CreateAppointmentResponseToJson(
        CreateAppointmentResponse instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'patientFullName': instance.patientFullName,
      'doctorName': instance.doctorName,
      'clinicName': instance.clinicName,
      'medicalRegisterNo': instance.medicalRegisterNo,
      'appointmentDate': instance.appointmentDate.toIso8601String(),
      'appointmentTimeFrom': instance.appointmentTimeFrom,
      'appointmentTimeTo': instance.appointmentTimeTo,
      'appointmentNo': instance.appointmentNo,
      'isInserted': instance.isInserted,
      'resultMessage': instance.resultMessage,
      'fK_MedDoctorScheduleId': instance.fKMedDoctorScheduleId,
    };
