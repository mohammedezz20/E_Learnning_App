import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderPickerContainer extends StatefulWidget {
  const GenderPickerContainer({super.key, required this.backgroundColor});

  final Color backgroundColor;

  @override
  State<GenderPickerContainer> createState() => _GenderPickerContainerState();
}

class _GenderPickerContainerState extends State<GenderPickerContainer> {
  String? selectedValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(12)),
      child: DropdownButton<String>(
        dropdownColor: widget.backgroundColor,
        iconEnabledColor: Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.circular(12),
        style: Theme.of(context).textTheme.bodyMedium,
        icon: const Icon(FontAwesomeIcons.caretDown),
        value: selectedValue,
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        underline: Container(),
        onChanged: (newValue) {
          selectedValue = newValue;
          setState(() {});
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
