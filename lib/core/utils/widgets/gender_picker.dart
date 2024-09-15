import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderPickerContainer extends StatelessWidget {
  const GenderPickerContainer(
      {super.key,
      required this.backgroundColor,
      required this.selectedValue,
      required this.onChanged});

  final Color backgroundColor;

  final String selectedValue;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(12)),
      child: DropdownButton<String>(
        dropdownColor: backgroundColor,
        iconEnabledColor: Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.circular(12),
        style: Theme.of(context).textTheme.bodyMedium,
        icon: const Icon(FontAwesomeIcons.caretDown),
        value: selectedValue,
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        underline: Container(),
        onChanged: (newValue) {
          onChanged(newValue!);
        },
        items: <String>['Female', 'Male']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
