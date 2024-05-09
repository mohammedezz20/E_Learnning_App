import 'package:country_picker/country_picker.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryPickerContainer extends StatefulWidget {
  CountryPickerContainer({super.key, this.country = 'Egypt'});

  String country;

  @override
  State<CountryPickerContainer> createState() => _CountryPickerContainerState();
}

class _CountryPickerContainerState extends State<CountryPickerContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            bottomSheetHeight: 500,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            //Optional. Styles the search field.
            searchTextStyle: Theme.of(context).textTheme.bodySmall,
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
          ),
          onSelect: (Country c) {
            widget.country = c.displayName;
            print('Select country: ${c.displayNameNoCountryCode}');
            setState(() {});
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CachHelper.getData(key: 'isDark')
              ? Color(0xff1f222a)
              : const Color(0xfffafafa),
        ),
        child: Row(
          children: [
            Text(widget.country, style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            const Icon(FontAwesomeIcons.caretDown),
          ],
        ),
      ),
    );
  }
}
