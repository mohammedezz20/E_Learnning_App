import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:e_learning_app/features/profile/data/models/menu_model.dart';
import 'package:e_learning_app/features/profile/presentation/cubit/states.dart';
import 'package:e_learning_app/features/profile/presentation/pages/edit_profile_screen/edit_profile_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/help_center_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/invite_friends_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/lanuage_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/notification/notification_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/payment/payment_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/privacy_policy_screen.dart';
import 'package:e_learning_app/features/profile/presentation/pages/security/security_screen.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/widgets/ImageUtil.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  final nameController = TextEditingController(text: 'Andrew Ainsley');
  final usernameController = TextEditingController(text: 'Andrew');
  final emailController =
      TextEditingController(text: 'andrew_ainsley@yourdomain.com');
  final dateOfBirthController = TextEditingController(text: '01/01/1995');
  final mobileController = TextEditingController(text: '1234567890');
  final jobController = TextEditingController(text: 'Student');
  File? pickedImage;
  List<Widget> screens = [
    const EditProfileScreen(),
    const NotificationScreen(),
    const PaymentScreen(),
    const SecurityScreen(),
    LanguageScreen(),
    const PrivacyPolicyScreen(),
    const HelpCenterScreen(),
    const InviteFriendsScreen(),
  ];
  String country = 'Egypt';
  String gender = 'Male';
  List<MenuModel> getMenuList(BuildContext context) {
    return [
      MenuModel(title: S.of(context).edit_profile, icon: FontAwesomeIcons.user),
      MenuModel(
          title: S.of(context).notifications, icon: FontAwesomeIcons.bell),
      MenuModel(title: S.of(context).payment, icon: FontAwesomeIcons.wallet),
      MenuModel(title: S.of(context).security, icon: FontAwesomeIcons.key),
      MenuModel(title: S.of(context).language, icon: FontAwesomeIcons.language),
      MenuModel(
          title: S.of(context).privacy_policy, icon: FontAwesomeIcons.lock),
      MenuModel(
          title: S.of(context).help_center, icon: FontAwesomeIcons.question),
      MenuModel(
          title: S.of(context).invite_friends, icon: FontAwesomeIcons.users),
      MenuModel(title: S.of(context).dark_mode, icon: FontAwesomeIcons.eye),
      MenuModel(
          title: S.of(context).logout,
          icon: FontAwesomeIcons.arrowRightFromBracket),
    ];
  }

  selectCountry(Country c) {
    country = c.name;
    emit(SelectCountryState());
  }

  void pickImageFromGallery() async {
    File? temp = await ImageUtil.galleryImage();
    if (temp != null) {
      pickedImage = temp;
      emit(PickImageSuccessState());
    } else {
      emit(PickImageErrorState());
    }
  }

  void pickImageFromCamera() async {
    File? temp = await ImageUtil.cameraImage();
    if (temp != null) {
      pickedImage = temp;
      emit(PickImageSuccessState());
    } else {
      emit(PickImageErrorState());
    }
  }

  changeGender(String value) {
    gender = value;
    emit(ChangeGenderState());
  }
}
