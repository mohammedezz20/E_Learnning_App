import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/country_picker_container.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/core/utils/widgets/gender_picker.dart';
import 'package:e_learning_app/core/utils/widgets/mobileFormField.dart';
import 'package:e_learning_app/features/profile/presentation/cubit/cubit.dart';
import 'package:e_learning_app/features/profile/presentation/cubit/states.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    DateTime? chosenDate = DateTime.now();
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
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
                    controller: cubit.nameController,
                    backgroundColor: !CachHelper.getData(key: 'isDark')
                        ? const Color(0xfffafafa)
                        : const Color(0xff1f222a),
                    sizedBoxHeight: 20,
                  ),
                  CustomFormField(
                    controller: cubit.usernameController,
                    backgroundColor: !CachHelper.getData(key: 'isDark')
                        ? const Color(0xfffafafa)
                        : const Color(0xff1f222a),
                    sizedBoxHeight: 20,
                  ),
                  CustomFormField(
                    controller: cubit.dateOfBirthController,
                    keyboardType: TextInputType.datetime,
                    backgroundColor: !CachHelper.getData(key: 'isDark')
                        ? const Color(0xfffafafa)
                        : const Color(0xff1f222a),
                    sizedBoxHeight: 20,
                    onTapOutside: (p0) {
                      Navigator.pop(context);
                    },
                    suffix: IconButton(
                      onPressed: () async {
                        chosenDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970, 1, 1),
                          lastDate: DateTime.now(),
                        );
                        cubit.dateOfBirthController.text =
                            chosenDate.toString().substring(0, 10);
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  CustomFormField(
                    controller: cubit.emailController,
                    backgroundColor: !CachHelper.getData(key: 'isDark')
                        ? const Color(0xfffafafa)
                        : const Color(0xff1f222a),
                    suffix: Icon(
                      Icons.email_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    sizedBoxHeight: 20.h,
                  ),
                  CountryPickerContainer(
                    onSelect: cubit.selectCountry,
                    country: cubit.country,
                  ),
                  20.h.sizedBoxHeight,
                  MobileFormField(
                    controller: cubit.mobileController,
                    backgroundColor: CachHelper.getData(key: 'isDark')
                        ? const Color(0xff1f222a)
                        : const Color(0xfffafafa),
                  ),
                  20.h.sizedBoxHeight,
                  GenderPickerContainer(
                    backgroundColor: CachHelper.getData(key: 'isDark')
                        ? const Color(0xff1f222a)
                        : const Color(0xfffafafa),
                    onChanged: cubit.changeGender,
                    selectedValue: cubit.gender,
                  ),
                  20.h.sizedBoxHeight,
                  CustomFormField(
                    controller: cubit.jobController,
                    backgroundColor: !CachHelper.getData(key: 'isDark')
                        ? const Color(0xfffafafa)
                        : const Color(0xff1f222a),
                    sizedBoxHeight: 20,
                  ),
                  20.h.sizedBoxHeight,
                  CustomButton(
                    onPressed: () {
                      // TODO: create update profile method.
                    },
                    backgroundColor: const Color(0xff335ef7),
                    text: S.of(context).update,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
