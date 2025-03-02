class EndPoints {
  /// BASE URL
  static const String BASE_URL = 'http://46.235.91.230:77/api';

  /// LOGIN
  static const String LOGIN_URL = '/Authentication/LoginMobile';

  /// CREATE PATIENT
  static const String CREATE_PATENT = '/Authentication/RegisterMobileUser';

  /// GET PATIENT
  static const String GET_PATIENT_STATISTICS_CHART =
      '/PatientProfile/GetPatientStatisticsAndCharts';

  /// GET PATIENT APPOINTMENTS
  static String GET_PATIENT_APPOINTMENTS(int branchId) =>
      '/PatientProfile/GetAppointementsForPatient?branchId=$branchId';

  /// GET CLINICS
  static const String GET_ALL_CLINICS = '/Mobile/GetAllClinics';

  /// GET DOCTORS BY CLINIC
  static String GET_ALL_DOCTORS_BY_CLINIC_ID(String id) =>
      '/Mobile/GetAllDoctorsByClinicId?clinicId=$id';

  /// GET DOCTOR SCHEDULE
  static String GET_DOCTOR_SCHEDULE_BY_DOCTOR_ID(String id) =>
      '/Mobile/GetDoctorSchedule?doctorId=$id';

  /// GET DOCTOR SCHEDULE BY DATE
  static const String GET_DOCTOR_SCHEDULE_BY_DOCTOR_ID_DATE =
      '/Mobile/GetDoctorScheduleByDate';

  /// CREATE APPOINTMENT
  static const String CREATE_PATIENT_APPOINTMENT =
      '/Mobile/CreatePatientAppointment';

  /// GET PATIENT BY MRN
  static String GET_PATIENT_BY_MRN(String mrn) =>
      '/Mobile/GetPatientByMRN?medicalRegisterNo=$mrn';

  static const String GET_LATEST_DOCTORS = '/Mobile/GetLastestDoctors';

  ///#####################################################################

  static const String GET_PATIENT_BY_HAWIA =
      '/bot/Patient/GetPatientByHawia?hawia=';

  /// DELETE PATIENT
  static const String DELETE_PATIENT_BY_ID =
      '/bot/Patient/DeletePatient?patientId=';

  /// GET PATIENT APPOINTMENTS
  static const String GET_PATIENT_APPOINTMENTS_BY_HAWIA =
      '/bot/Patient/GetPatientAppointmentsByHawia?hawia =';

  static const String GET_PATIENT_APPOINTMENTS_BY_MOBILE_NUMBER =
      '/bot/Patient/GetPatientAppointmentsByMobile?mobile =';

  static const String GET_PATIENT_APPOINTMENTS_BY_MRN =
      '/bot/Patient/GetPatientAppointmentsByMRN?medicalRegisterNo=';

  static const String GET_PATIENT_APPOINTMENTS_BY_PATIENT_ID =
      '/bot/Patient/GetPatientAppointmentsByPatientId?id =';

  /// CANCEL APPOINTMENT
  static const String CANCEL_PATIENT_APPOINTMENT_BY_APPOINTMENT_ID =
      '/bot/patient/CancelByAppointmentId?patient AppointmentId=';

  static const String CANCEL_PATIENT_APPOINTMENTS_BY_PATIENT_ID =
      '/bot/patient/CancelAllByAppointmentsByPatientID?patientId=';

  static const String CANCEL_PATIENT_APPOINTMENTS_BY_CLINIC_PATIENT_DATE =
      '/bot/patient/CancelPatientAppointments';

  /// UPDATE APPOINTMENT
  static const String UPDATE_PATIENT_APPOINTMENT =
      '/bot/patient/UpdatePatientAppointment';

  static const String GET_DOCTOR_SCHEDULE_DATE =
      '/bot/patient/GetDoctorScheduleByDate';

  /// GET DOCTOR APPOINTMENTS
  static const String GET_DOCTOR_NEAREST_FIVE_APPOINTMENTS =
      '/bot/patient/GetDoctorNearestFiveAppointments?doctorId=';
}
