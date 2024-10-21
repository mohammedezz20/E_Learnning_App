import 'package:country_picker/country_picker.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryPickerContainer extends StatelessWidget {
  const CountryPickerContainer(
      {super.key, this.country = 'Egypt', required this.onSelect});

  final String country;
  final void Function(Country) onSelect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            flagSize: 25.r,
            backgroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16.sp, color: Colors.blueGrey),
            bottomSheetHeight: 500.h,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0.r),
              topRight: Radius.circular(20.0.r),
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
          onSelect: (Country country) {
            onSelect(country);
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CachHelper.getData(key: 'isDark')
              ? const Color(0xff1f222a)
              : const Color(0xfffafafa),
        ),
        child: Row(
          children: [
            Text(country, style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            const Icon(FontAwesomeIcons.caretDown),
          ],
        ),
      ),
    );
  }
}
