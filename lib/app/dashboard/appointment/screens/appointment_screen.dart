import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/appointment/controllers/appointment_controller.dart';

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
