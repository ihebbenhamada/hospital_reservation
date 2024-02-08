import 'doctor.dart';

class DoctorsByClinicResponse {
  final List<Doctor> doctorsByClinic;

  DoctorsByClinicResponse({required this.doctorsByClinic});

  factory DoctorsByClinicResponse.fromJson(List<dynamic> json) {
    List<Doctor> doctorsByClinicList = json
        .map((doctorsByClinicJson) => Doctor.fromJson(doctorsByClinicJson))
        .toList();
    return DoctorsByClinicResponse(doctorsByClinic: doctorsByClinicList);
  }

  List<Map<String, dynamic>> toJson() {
    return doctorsByClinic.map((doctors) => doctors.toJson()).toList();
  }
}
