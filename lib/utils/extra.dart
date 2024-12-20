
// import 'package:appointment_demo/utils/selected_hour.dart';
// import 'package:appointment_demo/utils/selected_minute.dart';
// import 'package:appointment_demo/utils/selected_time_display.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/appointment_controller.dart';

// class RescheduleAppointmentView extends StatelessWidget {
//   final AppointmentController controller = Get.put(AppointmentController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Reschedule Appointment",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Text("Select new date of your appointment"),
//             SizedBox(height: 8),
//             Obx(() => TextButton(
//                   onPressed: () async {
//                     DateTime? picked = await showDatePicker(
//                       context: context,
//                       initialDate: controller.selectedDate.value,
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2100),
//                     );
//                     if (picked != null) {
//                       controller.setDate(picked);
//                     }
//                   },
//                   child: Text(
//                     controller.selectedDate.value.toLocal().toString().split(' ')[0],
//                   ),
//                 )),
//             SizedBox(height: 16),
//             // Display the selected time (hour and minute)
//             SelectedTimeDisplay(controller: controller),
//             SizedBox(height: 16),
//             // Hour selection
//             HourSelection(controller: controller),
//             SizedBox(height: 16),
//             // Minute selection
//             MinuteSelection(controller: controller),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => Get.back(),
//                   child: Text("Cancel"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => controller.rescheduleAppointment(),
//                   child: Text("Reschedule"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



 // ElevatedButton(
            //   onPressed: () async {
            //     DateTime? picked = await showDatePicker(
            //       context: context,
            //       initialDate: currentAppointment.dateTime,
            //       firstDate: DateTime(2000),
            //       lastDate: DateTime(2100),
            //     );
            //     if (picked != null && picked != currentAppointment.dateTime) {
            //       setState(() {
            //         currentAppointment = Appointment(
            //           title: currentAppointment.title,
            //           dateTime: picked,
            //           description: currentAppointment.description,
            //         );
            //       });
            //     }
            //   },
            //   child: Text("Change Date"),
            // ),
            // SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () async {
            //     TimeOfDay? pickedTime = await showTimePicker(
            //       context: context,
            //       initialTime: TimeOfDay.fromDateTime(currentAppointment.dateTime),
            //     );
            //     if (pickedTime != null) {
            //       setState(() {
            //         currentAppointment = Appointment(
            //           title: currentAppointment.title,
            //           dateTime: DateTime(
            //             currentAppointment.dateTime.year,
            //             currentAppointment.dateTime.month,
            //             currentAppointment.dateTime.day,
            //             pickedTime.hour,
            //             pickedTime.minute,
            //           ),
            //           description: currentAppointment.description,
            //         );
            //       });
            //     }
            //   },
            //   child: Text("Change Time"),
            // ),