import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/appointment_controller.dart';

class AppointmentScreen extends StatelessWidget {
  final _appointmentController = Get.put(AppointmentController());
  AppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('appointment'),
      ),
    );
  }
}
