
import 'dart:async';

import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _start = 30;
  bool _showResendButton = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _showResendButton = false;
    _start = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _showResendButton = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resendCode() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _showResendButton
          ? TextButton(
              onPressed: resendCode,
              child: const Text(
                'Resend Code',
                style: TextStyle(color: AppColor.blueColor),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Resend code in',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  ' $_start ',
                  style: const TextStyle(fontSize: 18, color: AppColor.blueColor),
                ),
                const Text(
                  'seconds',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
    );
  }
}

