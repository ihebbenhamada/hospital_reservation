import 'package:json_annotation/json_annotation.dart';

part 'top_doctor.g.dart';

@JsonSerializable()
class TopDoctor {
  final String doctor;
  final int rate;

  TopDoctor({
    required this.doctor,
    required this.rate,
  });

  factory TopDoctor.fromJson(Map<String, dynamic> json) =>
      _$TopDoctorFromJson(json);

  Map<String, dynamic> toJson() => _$TopDoctorToJson(this);
}
