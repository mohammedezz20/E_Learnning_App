import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuthScreen extends StatefulWidget {
  @override
  _FingerprintAuthScreenState createState() => _FingerprintAuthScreenState();
}

class _FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  String _authStatus = "Not Authenticated";
  bool _isFingerprintSet = false;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      setState(() {
      });
      authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint or enter PIN to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if (authenticated) {
        setState(() {
          _isFingerprintSet = true;
          _authStatus = "Fingerprint set successfully!";
        });
      } else {
        setState(() {
          _authStatus = "Failed to authenticate";
        });
      }
    } catch (e) {
      setState(() {
        _authStatus = "Error: $e";
      });
    } finally {
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set your Fingerprint'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(height: MediaQuery.of(context).size.height/3.5),
              const Icon(Icons.fingerprint, size: 200, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                _authStatus,
                style: TextStyle(
                  fontSize: 18,
                  color: _authStatus == "Fingerprint set successfully!"
                      ? Colors.green
                      : Colors.red,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(backgroundColor: AppColor.greyColor!,textColor:AppColor.blueColor,
                     width: double.infinity, text: 'Skip' ),
                  
                    // child: ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('Skip'),
                    // ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(backgroundColor: AppColor.blueColor,
                     width: double.infinity, text:_isFingerprintSet ? 'Continue' : 'Set' ),
                    // child: ElevatedButton(
                    //   onPressed: _isFingerprintSet ? () {
                    //     Navigator.pop(context);
                    //   } : _authenticate,
                    //   child: Text(_isFingerprintSet ? 'Continue' : 'Set'),
                    // ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}



