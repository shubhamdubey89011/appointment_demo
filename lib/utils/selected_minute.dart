// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/appointment_controller.dart';

// class MinuteSelection extends StatelessWidget {
//   final AppointmentController controller;

//   const MinuteSelection({Key? key, required this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return controller.selectedHour.value != null
//           ? Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: List.generate(12, (index) {
//                 int minute = index * 5; // Show minutes in multiples of 5
//                 return ChoiceChip(
//                   label: Text("$minute min"),
//                   selected: controller.selectedMinute.value == minute,
//                   onSelected: (bool selected) {
//                     if (selected) {
//                       controller.setMinute(minute); // Set selected minute
//                     } else {
//                       controller.setMinute(-1); // Set to null if deselected
//                     }
//                   },
//                   selectedColor: Colors.blue,
//                   backgroundColor: Colors.grey[200],
//                   labelStyle: TextStyle(
//                     color: controller.selectedMinute.value == minute ? Colors.white : Colors.black,
//                   ),
//                 );
//               }),
//             )
//           : Container(); // Show nothing if no hour is selected
//     });
//   }
// }
