import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/country_picker_container.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/core/utils/widgets/gender_picker.dart';
import 'package:e_learning_app/core/utils/widgets/mobileFormField.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final nameController = TextEditingController(text: 'Andrew Ainsley');
  final usernameController = TextEditingController(text: 'Andrew');
  final emailController =
      TextEditingController(text: 'andrew_ainsley@yourdomain.com');
  final dateOfBirthController = TextEditingController(text: '01/01/1995');
  final mobileController = TextEditingController(text: '1234567890');
  final jobController = TextEditingController(text: 'Student');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).edit_profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              CustomFormField(
                controller: nameController,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                sizedBoxHeight: 20,
              ),
              CustomFormField(
                controller: usernameController,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                sizedBoxHeight: 20,
              ),
              CustomFormField(
                controller: dateOfBirthController,
                keyboardType: TextInputType.datetime,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                sizedBoxHeight: 20,
                onTapOutside: (p0) {
                  Navigator.pop(context);
                },
                suffix: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2060),
                      currentDate: DateTime(2024),
                      initialDate: DateTime(2022),
                    );
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              CustomFormField(
                controller: emailController,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                suffix: Icon(
                  Icons.email_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                sizedBoxHeight: 20,
              ),
              CountryPickerContainer(),
              20.h.sizedBoxHeight,
              MobileFormField(
                controller: mobileController,
                backgroundColor: CachHelper.getData(key: 'isDark')
                    ? const Color(0xff1f222a)
                    : const Color(0xfffafafa),
              ),
              20.h.sizedBoxHeight,
              GenderPickerContainer(
                backgroundColor: CachHelper.getData(key: 'isDark')
                    ? const Color(0xff1f222a)
                    : const Color(0xfffafafa),
              ),
              20.h.sizedBoxHeight,
              CustomFormField(
                controller: jobController,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                sizedBoxHeight: 20,
              ),
              20.h.sizedBoxHeight,
              CustomButton(
                backgroundColor: const Color(0xff335ef7),
                text: S.of(context).update,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
