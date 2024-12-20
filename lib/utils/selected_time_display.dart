// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/appointment_controller.dart';

// class SelectedTimeDisplay extends StatelessWidget {
//   final AppointmentController controller;

//   const SelectedTimeDisplay({Key? key, required this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Box for displaying selected hour
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(
//             controller.selectedHour.value != null
//                 ? "Hour: ${controller.selectedHour.value}"
//                 : "Hour: Not Selected",
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//         ),
//         SizedBox(width: 16),
//         // Box for displaying selected minute
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(
//             controller.selectedMinute.value != null
//                 ? "Minute: ${controller.selectedMinute.value}"
//                 : "Minute: Not Selected",
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
// }
