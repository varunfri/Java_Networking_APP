// import 'package:flutter/material.dart';

// class ShowAlerts {
//   Future<dynamic> show_alerts(BuildContext context) {
//     return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder:
//           (_) => AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text("Internet is not connected!!"),
//                 Text("Location service is not enabled!!"),
//               ],
//             ),
//             actions: [
//               OutlinedButton.icon(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   checkStatus();
//                 },
//                 label: Text("Reconnect"),
//                 icon: Icon(Icons.autorenew_outlined),
//               ),
//             ],
//           ),
//     );
//   }
// }
