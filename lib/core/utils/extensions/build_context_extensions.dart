import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double h(double percentage) {
    var h = percentage / 844;
    return MediaQuery.of(this).size.height * h;
  }

  double w(double percentage) {
    var w = percentage / 390;
    return MediaQuery.of(this).size.width * w;
  }

  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  showAwesomeSnackbar({
    required String message,
    required String title,
    required ContentType contentType,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      clipBehavior: Clip.none,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(milliseconds: 2000),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  jumpTo(newScreen) =>
      Navigator.push(this, MaterialPageRoute(builder: (contxet) => newScreen));
  jumpToWithReplacement(newScreen) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (contxet) => newScreen));
  jumpToAndRemove(newScreen) => Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (contxet) => newScreen),
      (Route<dynamic> route) => false);
}





// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:flutter/material.dart';

// extension MediaQueryHelper on BuildContext {
//   // Returns the screen height
//   double get screenHeight => MediaQuery.of(this).size.height;

//   // Returns the screen width
//   double get screenWidth => MediaQuery.of(this).size.width;

//   // Returns the height of the screen as a percentage based on design height
//   double h(double percentage) {
//     var h = percentage / 843.4285714285714;
//     return MediaQuery.of(this).size.height * h;
//   }

//   // Returns the width of the screen as a percentage based on design width
//   double w(double percentage) {
//     var w = percentage / 411.42857142857144;
//     return MediaQuery.of(this).size.width * w;
//   }

//   // Returns the orientation of the device
//   Orientation get orientation => MediaQuery.of(this).orientation;

//   // Returns whether the device is in landscape mode
//   bool get isLandscape => orientation == Orientation.landscape;

//   // Returns whether the device is in portrait mode
//   bool get isPortrait => orientation == Orientation.portrait;

//   // Returns the padding of the safe area
//   EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

//   ShowSnackbar(text) {
//     return ScaffoldMessenger.of(this).showSnackBar(SnackBar(
//       content: Center(
//           child: Text(
//         textAlign: TextAlign.center,
//         "$text",
//         style: const TextStyle(color: Colors.white),
//       )),
//       padding: const EdgeInsets.all(10),
//       backgroundColor: Colors.teal[600],
//     ));
//   }

//   jumpTo(newScreen) =>
//       Navigator.push(this, MaterialPageRoute(builder: (contxet) => newScreen));
//   showAwesomeSnackbar({
//     required String message,
//     required String title,
//     required ContentType contentType,
//   }) {
//     final snackBar = SnackBar(
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.transparent,
//       content: AwesomeSnackbarContent(
//         title: title,
//         message: message,
//         messageFontSize: 18,
//         titleFontSize: 0,
//         contentType: contentType,
//       ),
//     );

//     return ScaffoldMessenger.of(this).showSnackBar(snackBar);
//   }
// }

// extension IntHelper on num {
//   SizedBox get SizedBoxWithHeight => SizedBox(
//         height: toDouble(),
//       );
//   SizedBox get SizedBoxWithWidth => SizedBox(
//         width: toDouble(),
//       );
// }

// extension StringHelper on String {
//   int ToInt() => int.parse(this);
//   num ToNum() => num.parse(this);
//   double ToDouble() => double.parse(this);
// }