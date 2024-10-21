import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeFormField extends StatefulWidget {
  const VerifyCodeFormField({super.key, this.length, required this.pinController,this.labelText});
  final int? length;
  final TextEditingController pinController;
  final String? labelText;

  @override
  State<VerifyCodeFormField> createState() => _VerifyCodeFormFieldState();
}

class _VerifyCodeFormFieldState extends State<VerifyCodeFormField> {
  @override
  Widget build(BuildContext context) {
    return  Form(
  child: Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text above the PinCodeTextField
      widget.labelText!=null? Center(
          child: Text(
            widget.labelText??'',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ):const SizedBox(),
        const SizedBox(height: 8.0), 
        PinCodeTextField(
          controller: widget.pinController,
          appContext: context,
          pastedTextStyle: const TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
          ),
          length: widget.length ?? 6,
          blinkWhenObscuring: false,
          animationType: AnimationType.scale,
          backgroundColor: Colors.transparent,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          validator: (v) {
            if (v!.length < (widget.length ?? 4)) {
              return S.of(context).code_validate;
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15),
            selectedColor: Colors.blue,
            activeBorderWidth: 2,
            selectedBorderWidth: 2,
            fieldHeight: widget.length == 6 ? 45 : 60,
            fieldWidth: widget.length == 6 ? 45 : 60,
            activeFillColor: Colors.blue.withOpacity(.15),
            inactiveFillColor: Colors.blueGrey.withOpacity(.15),
            selectedFillColor: Colors.blueGrey.withOpacity(.15),
            activeColor: Colors.blue.withOpacity(1),
            inactiveColor: Colors.blueGrey.withOpacity(.3),
          ),
          cursorColor: Colors.blue,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            // debugPrint("Completed");
          },
          onChanged: (value) {},
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ],
    ),
  ),
);
 }
}