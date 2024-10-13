import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeFormField extends StatelessWidget {
  const VerifyCodeFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return   Form(
               child: Padding(
                 padding: const EdgeInsets.symmetric(
                   vertical: 10.0,
                   horizontal: 20,
                 ),
                 child: PinCodeTextField(
                   appContext: context,
                   pastedTextStyle: const TextStyle(
                     color: Colors.transparent,
                     fontWeight: FontWeight.bold,
                   ),
                   length: 4,
                   blinkWhenObscuring: false,
                   animationType: AnimationType.scale,
                   backgroundColor: Colors.transparent,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   validator: (v) {
                     if (v!.length < 4) {
                       return S.of(context).code_validate;
                     } else {
                       return null;
                     }
                   },
                   pinTheme: PinTheme(
                     shape: PinCodeFieldShape.box,
                     borderRadius: BorderRadius.circular(15),
                     selectedColor: Colors.blue,
                     activeBorderWidth: 3,
                     selectedBorderWidth: 2,
                     fieldHeight: 60,
                     fieldWidth: 60,
                     activeFillColor: Colors.blue.withOpacity(.15),
                     inactiveFillColor:  Colors.blueGrey.withOpacity(.15),
                     selectedFillColor:   Colors.blueGrey.withOpacity(.15),
                     activeColor:Colors.blue.withOpacity(1),
                     inactiveColor: Colors.blueGrey.withOpacity(.3),
                   ),
                   cursorColor: Colors.blue,
                   animationDuration: const Duration(milliseconds: 300),
                   enableActiveFill: true,
                   keyboardType: TextInputType.number,
            
                   onCompleted: (v) {
                     // debugPrint("Completed");
                   },
                   // onTap: () {
                   //   print("Pressed");
                   // },
                   onChanged: (value) {
                   },
                   beforeTextPaste: (text) {
                      return true;
                   },
                 ),
               ),
             );
  }
}