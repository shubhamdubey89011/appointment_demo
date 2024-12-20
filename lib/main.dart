import 'package:appointment_demo/models/appointment_list_model.dart';
import 'package:appointment_demo/views/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Appointment> appointments = [
    Appointment(
      title: "Doctor's Appointment",
      dateTime: DateTime(2024, 12, 22, 10, 30),
      description: "Annual check-up",
    ),
    Appointment(
      title: "Meeting with John",
      dateTime: DateTime(2024, 12, 22, 15, 0),
      description: "Discuss project updates",
    ),
    Appointment(
      title: "Dentist Appointment",
      dateTime: DateTime(2024, 12, 23, 9, 0),
      description: "Routine cleaning",
    ),
  ];

  // Callback to update the appointment list when rescheduled
  void updateAppointment(Appointment updatedAppointment) {
    setState(() {
      // Find and update the appointment in the list
      int index = appointments.indexWhere(
        (appointment) => appointment.title == updatedAppointment.title,
      );
      if (index != -1) {
        appointments[index] = updatedAppointment;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'Appointment App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppointmentListScreen(
        appointments: appointments,
        onAppointmentUpdated: updateAppointment, // Pass the callback
      ),
    );
  }
}
