import 'package:flutter/material.dart';

class PinAuthScreen extends StatefulWidget {
  @override
  _PinAuthScreenState createState() => _PinAuthScreenState();
}

class _PinAuthScreenState extends State<PinAuthScreen> {
  String _enteredPin = '';
  
  // Replace this with the actual PIN logic
  static const String storedPin = '1234'; // Example stored PIN

  void _checkPin(BuildContext context) {
    if (_enteredPin == storedPin) {
      // Authentication successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication Successful!')),
      );
      // Proceed to next screen or action
    } else {
      // Authentication failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect PIN. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIN Authentication'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                obscureText: true, // Hides the PIN as the user types
                onChanged: (value) {
                  _enteredPin = value; // Capture the entered PIN
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your PIN',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _checkPin(context), // Check the entered PIN
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
