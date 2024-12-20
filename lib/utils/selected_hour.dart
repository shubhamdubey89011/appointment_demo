// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/appointment_controller.dart';

// class HourSelection extends StatelessWidget {
//   final AppointmentController controller;

//   const HourSelection({Key? key, required this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Wrap(
//           spacing: 8,
//           runSpacing: 8,
//           children: List.generate(12, (index) {
//             int hour = 7 + index;
//             String hourText = "${hour > 12 ? hour - 12 : hour} ${hour >= 12 ? 'PM' : 'AM'}";
//             return ChoiceChip(
//               label: Text(hourText),
//               selected: controller.selectedHour.value == hour,
//               onSelected: (bool selected) {
//                 if (selected) {
//                   controller.setHour(hour); // Update selected hour
//                 } else {
//                   controller.setHour(-1); // Use -1 as placeholder for no selection
//                 }
//               },
//               selectedColor: Colors.blue,
//               backgroundColor: Colors.grey[200],
//               labelStyle: TextStyle(
//                 color: controller.selectedHour.value == hour ? Colors.white : Colors.black,
//               ),
//             );
//           }),
//         ));
//   }
// }
