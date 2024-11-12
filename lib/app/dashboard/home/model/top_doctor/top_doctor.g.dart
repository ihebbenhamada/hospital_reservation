// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopDoctor _$TopDoctorFromJson(Map<String, dynamic> json) => TopDoctor(
      doctor: json['doctor'] as String,
      rate: (json['rate'] as num).toInt(),
    );

Map<String, dynamic> _$TopDoctorToJson(TopDoctor instance) => <String, dynamic>{
      'doctor': instance.doctor,
      'rate': instance.rate,
    };
