
import 'package:appointment_demo/models/appointment_list_model.dart';
import 'package:appointment_demo/views/appointment_details_screen.dart';
import 'package:flutter/material.dart';

class AppointmentListScreen extends StatelessWidget {
  final List<Appointment> appointments;
  final Function(Appointment) onAppointmentUpdated;

  AppointmentListScreen({Key? key, required this.appointments, required this.onAppointmentUpdated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];

          // Make sure the dateTime is valid before displaying it
          String formattedDate = appointment.dateTime != null
              ? appointment.dateTime.toLocal().toString()
              : "Invalid date"; // Fallback in case of invalid date
              print("Appointment DateTime: ${appointment.dateTime}");


          return ListTile(
            
            title: Text(appointment.title),
            subtitle: Text(formattedDate),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointment: appointment,
                      onAppointmentUpdated: onAppointmentUpdated,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
