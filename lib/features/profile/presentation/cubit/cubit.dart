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

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    EditProfileScreen(),
    const NotificationScreen(),
    const PaymentScreen(),
    const SecurityScreen(),
    LanguageScreen(),
    const PrivacyPolicyScreen(),
    const HelpCenterScreen(),
    const InviteFriendsScreen(),
  ];

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
}
