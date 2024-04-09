import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_text_field/phone_text_field.dart';

class MobileFormField extends StatelessWidget {
  const MobileFormField(
      {super.key, required this.controller, required this.backgroundColor});

  final TextEditingController controller;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // return PhoneTextField(
    //   locale: const Locale('en'),
    //   searchTextStyle: Theme.of(context).textTheme.bodySmall,
    //   decoration: InputDecoration(
    //     filled: true,
    //     enabled: true,
    //     fillColor: const Color(0xfffafafa),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(color: Color(0xfffafafa)),
    //     ),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(color: Color(0xfffafafa)),
    //     ),
    //     disabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(color: Color(0xfffafafa)),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(color: Color(0xfffafafa)),
    //     ),
    //     focusedErrorBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(color: Color(0xfffafafa)),
    //     ),
    //     errorBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(color: Color(0xfffafafa)),
    //     ),
    //   ),
    //   textStyle: Theme.of(context).textTheme.bodySmall,
    //   searchFieldInputDecoration: const InputDecoration(
    //     filled: true,
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //       borderSide: BorderSide(),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //     ),
    //     suffixIcon: Icon(Icons.search),
    //     hintText: "Search country",
    //   ),
    //
    //   initialCountryCode: "AE",
    //   onChanged: (phone) {
    //     debugPrint(phone.completeNumber);
    //   },
    // );
    return IntlPhoneField(
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        filled: true,
        enabled: true,
        fillColor: backgroundColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xfffafafa)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: backgroundColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: backgroundColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: backgroundColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: backgroundColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: backgroundColor),
        ),
      ),
      initialCountryCode: 'IN',
      pickerDialogStyle: PickerDialogStyle(
        countryCodeStyle: Theme.of(context).textTheme.bodySmall,
        countryNameStyle: Theme.of(context).textTheme.bodySmall,
      ),
      dropdownTextStyle: Theme.of(context).textTheme.bodySmall,
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
