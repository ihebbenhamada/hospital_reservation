import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inn_tech_appointment/app/dashboard/history/controllers/history_controller.dart';
import 'package:inn_tech_appointment/app/dashboard/home/controllers/home_controller.dart';
import 'package:inn_tech_appointment/app/dashboard/home/model/patient_statistic/patient_statistic.dart';
import 'package:inn_tech_appointment/app/make-appointment/appointment-success/screens/appointment_success_screen.dart';
import 'package:inn_tech_appointment/app/make-appointment/patient-information/screen/patient_information_screen.dart';
import 'package:inn_tech_appointment/app/notifications/screens/notifications_screen.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';
import 'package:inn_tech_appointment/config/strings/strings.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../config/interceptor/interceptor.dart';
import '../../../config/theme/theme_controller.dart';
import '../../../widgets/reservation-button/reservation-button.dart';
import '../../auth/login/models/login_response.dart';
import '../../auth/login/screens/login_screen.dart';
import '../../make-appointment/clinic-doctor/models/data_create_appointment/data_create_appointment.dart';
import '../../make-appointment/clinic-doctor/models/doctor_schedule/doctor_schedule.dart';
import '../../make-appointment/clinic-doctor/screen/clinic_doctor_screen.dart';
import '../../make-appointment/clinic-doctor/services/clinic_doctor_service.dart';
import '../../make-appointment/date-time-appointment/screen/date_time_appointment_screen.dart';
import '../../make-appointment/date-time-appointment/services/date_appointment_service.dart';
import '../../make-appointment/main/models/clinic/clinic.dart';
import '../../make-appointment/main/models/doctor/doctor.dart';
import '../../make-appointment/main/screen/appointment-steps.dart';
import '../../make-appointment/main/services/appointment_steps_service.dart';
import '../../make-appointment/patient-information/services/patient_info_service.dart';
import '../../profile/screen/profile_screen.dart';

class DashboardController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final ThemeController _themeController = Get.find();
  final AppointmentStepsService _appointmentStepsService =
      AppointmentStepsService();
  final ClinicDoctorService _clinicDoctorService = ClinicDoctorService();
  final DateAppointmentService _dateAppointmentService =
      DateAppointmentService();
  final PatientInfoService _patientInfoService = PatientInfoService();

  /// VARIABLES MAIN DASHBOARD
  int selectedIndex = 0;
  final GetStorage storage = GetStorage();
  final Rx<PatientStatistics> patient = PatientStatistics().obs;
  final PageController pageController = PageController();
  final RxInt pageIndex = 0.obs;
  final RxString firstButtonText = AppStrings.startYourAppointment.obs;

  /// VARIABLES CLINIC DOCTOR
  final RxList<Clinic> clinicsList = <Clinic>[].obs;
  final RxList<Doctor> doctorsList = <Doctor>[].obs;
  final Rx<Clinic?> selectedClinic = Clinic().obs;
  final Rx<Doctor?> selectedDoctor = Doctor().obs;
  Rx<DataCreateAppointment> dataCreateAppointment = DataCreateAppointment().obs;

  /// VARIABLES DATE TIME APPOINTMENT
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  DoctorSchedule selectedDoctorSchedule = DoctorSchedule();
  final RxList<DoctorSchedule> doctorScheduleList = <DoctorSchedule>[].obs;
  Rx<DataCreateAppointment> dataCreateAppointmentDateTimePage =
      DataCreateAppointment().obs;

  /// VARIABLES PATIENT INFO
  TextEditingController mrnTextEditingController = TextEditingController();
  TextEditingController serialTextEditingController = TextEditingController();
  TextEditingController patientNameTextEditingController =
      TextEditingController();
  TextEditingController doctorNameTextEditingController =
      TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  TextEditingController dateTextEditingController = TextEditingController();
  final Rx<LoginResponse> loginResponse = LoginResponse().obs;
  final RxBool isBackVisible = true.obs;

  @override
  void onInit() {
    initViews();
    super.onInit();
  }

  @override
  void dispose() {
    mrnTextEditingController.dispose();
    serialTextEditingController.dispose();
    patientNameTextEditingController.dispose();
    doctorNameTextEditingController.dispose();
    mobileTextEditingController.dispose();
    dateTextEditingController.dispose();
    super.dispose();
  }

  onItemSelected(int index) {
    if (index == 4) {
      storage.erase();
      selectedIndex = 0;
      //update();
      Get.offAll(
        () => LoginScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );

      /*storage.remove('user');
      storage.remove('token');
      storage.remove('patient');
      storage.remove('mrn');
      storage.remove('patientName');
      Get.offAll(
        () => LoginScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );*/
    } else if (index == 2) {
      Get.to(
        () => AppointmentStepsScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      selectedIndex = index;
      update();
    }
  }

  navigateToPage(int index, BuildContext context) {
    Navigator.of(context).pop(); // Close the drawer if open
    selectedIndex = index;
    update();
  }

  animateTo(int input) {
    pageIndex.value = input;
    isBackVisible.value = pageIndex.value == 4 ? false : true;
    firstButtonText.value = pageIndex.value == 0
        ? AppStrings.startYourAppointment
        : pageIndex.value == 3
            ? AppStrings.confirm
            : pageIndex.value == 4
                ? AppStrings.continueText
                : AppStrings.next;

    pageController.animateToPage(input,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  bookNow() {
    Get.bottomSheet(
      isScrollControlled: true,
      GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(Get.context!).size.width,
            height: MediaQuery.of(Get.context!).size.height,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(Get.context!).size.height,
            ),
            color: _themeController.isDarkMode.value
                ? AppColors.dark2
                : AppColors.blueLight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(Get.context!).size.height * 0.79,
                  ),
                  child: PageView(
                    controller: pageController,
                    pageSnapping: false,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (int index) {
                      pageIndex.value = index;
                    },
                    children: <Widget>[
                      AppointmentStepsScreen(),
                      ClinicDoctorScreen(),
                      DateTimeAppointmentScreen(),
                      PatientInformationScreen(),
                      AppointmentSuccessScreen(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
                    right: 40,
                    left: 40,
                  ),
                  child: Obx(
                    () => Column(
                      children: [
                        ReservationButton(
                          text: firstButtonText.value.tr,
                          onClick: onClickNext,
                        ),
                        20.h.verticalSpace,
                        isBackVisible.isTrue
                            ? ReservationButton(
                                text: AppStrings.back.tr,
                                isPrimary: false,
                                onClick: onClickBack,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: AppColors.gray1,
      isDismissible: true,
      enableDrag: false,
    );
  }

  onClickNext() {
    switch (pageIndex.value) {
      case 0:
        handleClickMakeAppointment();
        break;
      case 1:
        handleClickNextInPageClinicDoctor();
        break;
      case 2:
        handleClickNextPageDateTimeAppointment();
        break;
      case 3:
        handleClickConfirm();
        break;
      case 4:
        Get.back();
        pageIndex.value = 0;
        isBackVisible.value = true;
        firstButtonText.value = AppStrings.startYourAppointment;
        HomeController homeController = Get.find();
        HistoryController historyController = Get.find();
        homeController.getHomeInformation();
        historyController.getPatientsAppointments();
        selectedDate.value = DateTime.now();
        break;
    }
  }

  onClickBack() {
    if (pageIndex.value == 0) {
      Get.back();
      return;
    }
    if (pageIndex.value == 2) {
      selectedDate.value = DateTime.now();
    }
    pageIndex.value--;
    animateTo(pageIndex.value);
  }

  handleClickNotifications() {
    Get.to(
      () => NotificationsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  handleClickProfile() {
    Get.to(
      () => ProfileScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  initViews() {
    if (GetStorage().read('patient') != null) {
      patient.value = PatientStatistics.fromJson(
        GetStorage().read('patient') as Map<String, dynamic>,
      );
    }
  }

  ///PAGE START MAKE APPOINTMENT
  handleClickMakeAppointment() {
    AppInterceptor.showLoader();
    _appointmentStepsService.getAllClinics().then((clinics) {
      if (clinics != null && clinics.isNotEmpty) {
        _appointmentStepsService
            .getDoctorsByClinic(clinicId: clinics[0].id)
            .then((doctors) {
          if (doctors != null) {
            clinicsList.value = clinics;
            doctorsList.value = doctors;
            selectedClinic.value =
                clinicsList.isNotEmpty ? clinicsList.first : Clinic();
            selectedDoctor.value =
                doctorsList.isNotEmpty ? doctorsList.first : Doctor();
            dataCreateAppointment.value.doctorId = selectedDoctor.value?.id;
            dataCreateAppointment.value.clinicId = selectedClinic.value?.id;
            dataCreateAppointment.value.fKDefBranchId =
                selectedDoctor.value?.fKDefBranchId;
            pageIndex.value++;
            animateTo(pageIndex.value);
          }
          AppInterceptor.hideLoader();
          return true;
        });
      }
      return false;
    });
  }

  ///PAGE CLINIC DOCTORS
  handleClickNextInPageClinicDoctor() {
    if (doctorsList.isEmpty) {
      Get.snackbar(
        AppStrings.error.tr,
        AppStrings.shouldSelectDoctor.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    AppInterceptor.showLoader();
    _clinicDoctorService
        .getDoctorSchedule(
      doctorId: selectedDoctor.value?.id ?? 0,
      date: DateTime.now().toString().substring(0, 10),
    )
        .then((value) {
      if (value != null) {
        doctorScheduleList.value = value;
        if (doctorScheduleList.isNotEmpty) {
          selectedDoctorSchedule = doctorScheduleList
              .firstWhere((value) => value.appointmentAvailable == true);
          update();
        }
        dataCreateAppointmentDateTimePage.value = dataCreateAppointment.value;
        dataCreateAppointmentDateTimePage.value.appointmentDate =
            DateTime.now().toString().substring(0, 10);
        pageIndex.value++;
        animateTo(pageIndex.value);
      }
      AppInterceptor.hideLoader();
    });
  }

  onSelectDoctor(Doctor? value) {
    selectedDoctor.value = value!;
    dataCreateAppointment.value.doctorId = value.id;
    dataCreateAppointment.value.fKDefBranchId =
        selectedDoctor.value?.fKDefBranchId;
  }

  onSelectClinic(Clinic value) {
    selectedClinic.value = value;
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

  ///DATE TIME APPOINTMENT
  selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black1, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black1, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      AppInterceptor.showLoader();
      dataCreateAppointmentDateTimePage.value.appointmentDate =
          pickedDate.toString().substring(0, 10);
      _clinicDoctorService
          .getDoctorSchedule(
        doctorId: dataCreateAppointmentDateTimePage.value.doctorId ?? 0,
        date: pickedDate.toString().substring(0, 10),
      )
          .then((value) {
        if (value != null) {
          doctorScheduleList.value = value;
          if (doctorScheduleList.isNotEmpty) {
            selectedDoctorSchedule = doctorScheduleList
                .firstWhere((value) => value.appointmentAvailable == true);
            update();
          }
        }
        AppInterceptor.hideLoader();
      });
    }
  }

  selectTime(DoctorSchedule doctorSchedule) {
    selectedDoctorSchedule = doctorSchedule;
    update();
  }

  handleClickNextPageDateTimeAppointment() {
    if (doctorScheduleList.isNotEmpty) {
      AppInterceptor.showLoader();
      _dateAppointmentService
          .getPatientByMrn(mrn: GetStorage().read('mrn') ?? "0")
          .then((value) {
        if (value != null) {
          dataCreateAppointment.value.fKMedDoctorScheduleId =
              selectedDoctorSchedule.fKMedDoctorScheduleId;
          dataCreateAppointment.value.appointmentTimeFrom =
              selectedDoctorSchedule.startTime;
          dataCreateAppointment.value.appointmentTimeTo =
              selectedDoctorSchedule.endTime;
          dataCreateAppointment.value.appointmentNo =
              selectedDoctorSchedule.serial;
          dataCreateAppointment.value.medicalRegisterNo =
              GetStorage().read('mrn') ?? '';
          dataCreateAppointment.value.patientId = value.id;
          AppInterceptor.hideLoader();
          if (GetStorage().read('user') is Map<String, dynamic>) {
            loginResponse.value = LoginResponse.fromJson(
                GetStorage().read('user') as Map<String, dynamic>);
          } else if (GetStorage().read('user') is LoginResponse) {
            loginResponse.value = GetStorage().read('user') as LoginResponse;
          }
          mrnTextEditingController = TextEditingController();
          serialTextEditingController = TextEditingController();
          patientNameTextEditingController = TextEditingController();
          doctorNameTextEditingController = TextEditingController();
          mobileTextEditingController = TextEditingController();
          dateTextEditingController = TextEditingController();

          mrnTextEditingController.text =
              dataCreateAppointment.value.medicalRegisterNo ?? '';
          serialTextEditingController.text =
              dataCreateAppointment.value.appointmentNo.toString();
          patientNameTextEditingController.text =
              GetStorage().read('patientName') ?? "";
          mobileTextEditingController.text = (LoginResponse.fromJson(
                  GetStorage().read('user') as Map<String, dynamic>))
              .phoneNumber;
          pageIndex.value++;
          animateTo(pageIndex.value);
        }
      });
    } else {
      Get.snackbar(
        AppStrings.error.tr,
        AppStrings.shouldSelectAvailableDate.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  ///PAGE PATIENT INFOS
  handleClickConfirm() {
    AppInterceptor.showLoader();
    _patientInfoService
        .createAppointment(data: dataCreateAppointment.value)
        .then((value) {
      AppInterceptor.hideLoader();
      if (value != null && value.resultMessage == 'Saved successfully') {
        pageIndex.value++;
        animateTo(pageIndex.value);
        /*Get.off(
          () => AppointmentSuccessScreen(
              mrn: mrnTextEditingController.text,
              name: patientNameTextEditingController.text,
              phone: mobileTextEditingController.text),
          transition: Transition.rightToLeft,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );*/
      }
    });
  }

  Future<List<Clinic>> searchClinic(String value) async {
    final query = value.toLowerCase();
    final isEnglish = Get.locale?.languageCode == 'en';
    return clinicsList.where((clinic) {
      final name = isEnglish
          ? clinic.departmentNameEn.toLowerCase()
          : clinic.departmentNameAr.toLowerCase();
      return name.contains(query);
    }).toList();
  }

  Future<List<Doctor>> searchDoctor(String value) async {
    return doctorsList
        .where((doctor) =>
            doctor.fullName.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
