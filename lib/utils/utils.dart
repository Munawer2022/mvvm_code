import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

extension EmptySpace on num {
  // SizedBox get height => SizedBox(
  //       height: toDouble(),
  //     );
  // SizedBox get width => SizedBox(
  //       width: toDouble(),
  //     );
}

class Utils {
// void showErrorBanner(String text) {
//   var materialBanner = MaterialBanner(
//     elevation: 1,
//     backgroundColor: Colors.grey.shade200,
//     content: Text(text),
//     actions: [
//       TextButton(
//         onPressed: () {
//           MyApp.scaffoldMessengerKey.currentState!.hideCurrentMaterialBanner();
//         },
//         child: Text('Dismiss'),
//       ),
//     ],
//   );

//   // Use the ScaffoldMessengerKey to hide any current MaterialBanner and show a new one
//   MyApp.scaffoldMessengerKey.currentState!
//     ..hideCurrentMaterialBanner()
//     ..showMaterialBanner(materialBanner);
// }

// snackbar(text, context) {
//   var snackBar = SnackBar(
//     backgroundColor: Colors.green.shade300,
//     content: SizedBox(
//       height: MediaQuery.of(context).size.height * 0.04,
//       child: Text(
//         text,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     ),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

// errorSnackbar(text, context) {
//   var snackBar = SnackBar(
//     backgroundColor: Colors.red.shade300,
//     content: SizedBox(
//       height: MediaQuery.of(context).size.height * 0.04,
//       child: Text(
//         text,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     ),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
}

void setCustomSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: true,
    systemStatusBarContrastEnforced: true,
  ));
}