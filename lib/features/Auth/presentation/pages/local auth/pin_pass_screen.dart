import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/local%20auth/finger_print_screen.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/verify_code_form_field.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CreatePinScreen extends StatefulWidget {
  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  TextEditingController pinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();

  final _storage = const FlutterSecureStorage();
  String _statusMessage = '';

  Future<void> _savePin() async {
    if (pinController.text == confirmPinController.text && pinController.text.isNotEmpty) {
      await _storage.write(key: 'userPin', value: pinController.text);
      if (!mounted) return;
      setState(() {
        _statusMessage = 'PIN saved successfully!';
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FingerprintAuthScreen(),
        ),
      );
    } else {
      if (!mounted) return;
      setState(() {
        _statusMessage = 'PINs do not match or are empty. Please try again.';
      });
    }
  }

 @override
  void dispose() {
    pinController.dispose();
    confirmPinController.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a New PIN'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerifyCodeFormField(
                pinController: pinController,
                length: 4,
                labelText: "Enter New PIN",
              ),
              const SizedBox(height: 20),
              VerifyCodeFormField(
                pinController: confirmPinController,
                length: 4,
                labelText: "Confirm New PIN",
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 15, left: 15),
                child: CustomButton(
                  onPressed: () async {
                    await _savePin();
                    if (mounted) {
                      showSnackBar(context: context, message: _statusMessage);
                    }
                  },
                  text: S.of(context).verify,
                  backgroundColor: AppColor.blueColor,
                  width: double.infinity,
                ),
              ),
              Text(_statusMessage, style: const TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
