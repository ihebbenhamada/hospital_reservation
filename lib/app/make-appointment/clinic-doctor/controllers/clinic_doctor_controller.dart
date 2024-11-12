import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/services/clinic_doctor_service.dart';
import 'package:reservation/app/make-appointment/date-time-appointment/screen/date_time_appointment_screen.dart';
import 'package:reservation/app/make-appointment/main/models/doctor/doctor.dart';
import 'package:reservation/config/interceptor/interceptor.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../main/models/clinic/clinic.dart';
import '../../main/services/appointment_steps_service.dart';
import '../models/data_create_appointment/data_create_appointment.dart';

class ClinicDoctorController extends BaseController {
  /// SERVICE
  final ClinicDoctorService _clinicDoctorService = ClinicDoctorService();
  final AppointmentStepsService _appointmentStepsService =
      AppointmentStepsService();

  /// CONTROLLERS

  /// VARIABLES
  final RxList<Clinic> clinicsList = <Clinic>[].obs;
  final RxList<Doctor> doctorsList = <Doctor>[].obs;
  final Rx<Clinic?> selectedClinic = Clinic().obs;
  final Rx<Doctor?> selectedDoctor = Doctor().obs;
  Rx<DataCreateAppointment> dataCreateAppointment = DataCreateAppointment().obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    if (Get.arguments != null) {
      clinicsList.value = Get.arguments[0];

      selectedClinic.value =
          clinicsList.isNotEmpty ? clinicsList.first : Clinic();
      doctorsList.value = Get.arguments[1];
      selectedDoctor.value =
          doctorsList.isNotEmpty ? doctorsList.first : Doctor();

      dataCreateAppointment.value.doctorId = selectedDoctor.value?.id;
      dataCreateAppointment.value.clinicId = selectedClinic.value?.id;
      dataCreateAppointment.value.fKDefBranchId =
          selectedDoctor.value?.fKDefBranchId;
    }
  }

  /// FUNCTIONS
  onSelectDoctor(Doctor? value) {
    selectedDoctor.value = value!;
    dataCreateAppointment.value.doctorId = value.id;
    dataCreateAppointment.value.fKDefBranchId =
        selectedDoctor.value?.fKDefBranchId;
  }

  onSelectClinic(Clinic? value) {
    selectedClinic.value = value!;
    AppInterceptor.showLoader();
    _appointmentStepsService
        .getDoctorsByClinic(clinicId: value.id)
        .then((doctor) {
      if (doctor != null) {
        doctorsList.value = doctor;
        selectedDoctor.value =
            doctorsList.isNotEmpty ? doctorsList.first : Doctor();
        dataCreateAppointment.value.doctorId = selectedDoctor.value?.id;
        dataCreateAppointment.value.clinicId = value.id;
        dataCreateAppointment.value.fKDefBranchId =
            selectedDoctor.value?.fKDefBranchId;
      }
      AppInterceptor.hideLoader();
    });
  }

  handleClickNext() {
    AppInterceptor.showLoader();
    _clinicDoctorService
        .getDoctorSchedule(
      doctorId: selectedDoctor.value?.id ?? 0,
      date: DateTime.now().toString().substring(0, 10),
    )
        .then((value) {
      if (value != null) {
        Get.to(
          () => DateTimeAppointmentScreen(),
          arguments: [value, dataCreateAppointment.value],
          transition: Transition.rightToLeft,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
      AppInterceptor.hideLoader();
    });
  }

  void handleClickBack() async {
    Get.back();
  }
}
