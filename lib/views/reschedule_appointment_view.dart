// ignore_for_file: unnecessary_null_comparison

import 'package:appointment_demo/controllers/appointment_controller.dart';
import 'package:appointment_demo/models/appointment_list_model.dart';
import 'package:appointment_demo/views/appointment_details_screen.dart';
import 'package:flutter/material.dart';

class RescheduleAppointmentView extends StatefulWidget {
  final Function(Appointment) onAppointmentRescheduled; // Callback

  RescheduleAppointmentView({Key? key, required this.onAppointmentRescheduled}) : super(key: key);

  @override
  _RescheduleAppointmentViewState createState() =>
      _RescheduleAppointmentViewState();
}


class _RescheduleAppointmentViewState extends State<RescheduleAppointmentView> {
  final AppointmentController controller = AppointmentController();
  late Appointment currentAppointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    "By rescheduling the appointment you agree to these points:",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ...[
                    "Vivamus sagittis lacus vel augue.",
                    "Cum sociis natoque penatibus.",
                    "Cras mattis consectetur purus sit.",
                    "Lorem ipsum dolor sit amet.",
                  ].map((text) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(text, style: TextStyle(color: Colors.white)),
                      )),
                ],
              ),
            ),
          ),
          // Right Rescheduling Panel
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reschedule Appointment",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Text("Select new date of your appointment"),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: controller.selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            controller.setDate(picked);
                          });
                        }
                      },
                      child: Text(controller.selectedDate.toLocal().toString().split(' ')[0]),
                    ),
                    SizedBox(height: 16),
                    controller.selectedDate != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('Hour'),
                                        Text(
                                          controller.selectedHour != null
                                              ? " ${controller.selectedHour}"
                                              : "_   _",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('Minutes'),
                                        Text(
                                          controller.selectedMinute != null
                                              ? " ${controller.selectedMinute}"
                                              : "_   _",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text("Select Hour and Minute:"),
                              SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(12, (index) {
                                  int hour = 7 + index;
                                  String hourText =
                                      "${hour > 12 ? hour - 12 : hour} ${hour >= 12 ? 'PM' : 'AM'}";
                                  return ChoiceChip(
                                    label: Text(hourText),
                                    selected:
                                        controller.selectedHour == hour,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        if (selected) {
                                          controller.setHour(hour);
                                        } else {
                                          controller.setHour(-1);
                                        }
                                      });
                                    },
                                    selectedColor: Colors.blue,
                                    backgroundColor: Colors.grey[200],
                                    labelStyle: TextStyle(
                                      color: controller.selectedHour == hour
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: 16),
                              controller.selectedHour != null
                                  ? Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: List.generate(12, (index) {
                                        int minute = index * 5;
                                        return ChoiceChip(
                                          label: Text("$minute min"),
                                          selected:
                                              controller.selectedMinute == minute,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              if (selected) {
                                                controller.setMinute(minute);
                                              } else {
                                                controller.setMinute(-1);
                                              }
                                            });
                                          },
                                          selectedColor: Colors.blue,
                                          backgroundColor: Colors.grey[200],
                                          labelStyle: TextStyle(
                                            color: controller.selectedMinute == minute
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        );
                                      }),
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.selectedDate != null &&
                                controller.selectedHour != null &&
                                controller.selectedMinute != null) {
                              currentAppointment = Appointment(
                                title: "Rescheduled Appointment",
                                dateTime: DateTime(
                                  controller.selectedDate.year,
                                  controller.selectedDate.month,
                                  controller.selectedDate.day,
                                  controller.selectedHour!,
                                  controller.selectedMinute!,
                                ),
                                description: "Updated appointment description",
                              );

                              // Pass the updated appointment back to the parent
                              widget.onAppointmentRescheduled(currentAppointment);

                              // Navigate to Appointment Details Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppointmentDetailsScreen(
                                    appointment: currentAppointment,
                                    onAppointmentUpdated: (updatedAppointment) {
                                      widget.onAppointmentRescheduled(updatedAppointment);
                                    },
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please select a valid date, hour, and minute.'),
                              ));
                            }
                          },
                          child: Text("Schedule / Reschedule"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
