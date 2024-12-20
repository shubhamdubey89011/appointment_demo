import 'package:appointment_demo/models/appointment_list_model.dart';
import 'package:appointment_demo/views/reschedule_appointment_view.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final Appointment appointment;
  final Function(Appointment) onAppointmentUpdated; // Callback

  AppointmentDetailsScreen({Key? key, required this.appointment, required this.onAppointmentUpdated}) : super(key: key);

  @override
  _AppointmentDetailsScreenState createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  late Appointment currentAppointment;

  @override
  void initState() {
    super.initState();
    currentAppointment = widget.appointment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reschedule Appointment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reschedule Appointment for ${currentAppointment.title}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Current Scheduled Date and Time: ${currentAppointment.dateTime.toLocal()}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simulate rescheduling
                currentAppointment = Appointment(
                  title: currentAppointment.title,
                  dateTime: DateTime(2024, 12, 22, 11, 30), // New time
                  description: currentAppointment.description,
                );

                // Notify the parent screen about the updated appointment
                widget.onAppointmentUpdated(currentAppointment);

                // Navigate back to the appointment list
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RescheduleAppointmentView(
                      onAppointmentRescheduled: (updatedAppointment) {
                        setState(() {
                          currentAppointment = updatedAppointment; // Update the current appointment
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text("Reschedule Appointment"),
            ),
          ],
        ),
      ),
    );
  }
}
