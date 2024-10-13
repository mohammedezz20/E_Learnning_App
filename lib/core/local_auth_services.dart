import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics() async {
    bool isBiometricSupported = await auth.isDeviceSupported();
    bool canCheckBiometrics = await auth.canCheckBiometrics;

    if (isBiometricSupported && canCheckBiometrics) {
      try {
        return await auth.authenticate(
          localizedReason: 'Authenticate using your fingerprint',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } catch (e) {
        print("Error: $e");
        return false;
      }
    }
    return false;
  }

//  static void handleAuthentication( context) async {
//   final authService = AuthService();

//   // Attempt to authenticate with fingerprint
//   bool isAuthenticated = await authService.authenticateWithFingerprint();
//   if (!isAuthenticated) {
//     // If fingerprint fails, ask for PIN
//     bool pinAuthenticated = await authService.authenticateWithPin(context);
//     if (pinAuthenticated) {
//       // Proceed to the next screen
//     } else {
//       // Handle authentication failure
//     }
//   } else {
//     // Proceed to the next screen
//   }
// }




}



class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticateWithFingerprint() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to access',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true, // Only allow biometric authentication
        ),
      );
    } catch (e) {
      print(e);
    }
    return authenticated;
  }

  Future<bool> authenticateWithPin(BuildContext context) async {
    // Show a dialog to enter the PIN
    String? enteredPin = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String pin = '';
        return AlertDialog(
          title: const Text('Enter PIN'),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              pin = value;
            },
            decoration: const InputDecoration(hintText: 'Enter your PIN'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(pin);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // Check if the entered PIN matches your stored PIN
    return enteredPin == 'YOUR_STORED_PIN'; // Replace with your logic
  }}
