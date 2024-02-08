import 'clinic.dart';

class ClinicResponse {
  final List<Clinic> clinics;

  ClinicResponse({required this.clinics});

  factory ClinicResponse.fromJson(List<dynamic> json) {
    List<Clinic> clinicList =
        json.map((clinicJson) => Clinic.fromJson(clinicJson)).toList();
    return ClinicResponse(clinics: clinicList);
  }

  List<Map<String, dynamic>> toJson() {
    return clinics.map((clinic) => clinic.toJson()).toList();
  }
}
