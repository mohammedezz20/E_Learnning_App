import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuthScreen extends StatefulWidget {
  @override
  _FingerprintAuthScreenState createState() => _FingerprintAuthScreenState();
}

class _FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticating = false;
  String _authStatus = "Not Authenticated";

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      setState(() {
        _authStatus = authenticated ? "Authenticated" : "Failed to authenticate";
      });
    } catch (e) {
      setState(() {
        _authStatus = "Error: $e";
      });
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  void _showFingerprintDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Fingerprint Authentication"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.fingerprint, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text("Touch the fingerprint sensor"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _authenticate();
                print("Authenticating...$_authStatus");
              },
              child: Text("Authenticate"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showFingerprintDialog,
              child: Text('Authenticate with Fingerprint'),
            ),
            SizedBox(height: 20),
            Text(
              _authStatus,
              style: TextStyle(fontSize: 18, color: _authStatus == "Authenticated" ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

