// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `change language`
  String get b1 {
    return Intl.message(
      'change language',
      name: 'b1',
      desc: '',
      args: [],
    );
  }

  /// `change theme`
  String get b2 {
    return Intl.message(
      'change theme',
      name: 'b2',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message(
      'Security',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get help_center {
    return Intl.message(
      'Help Center',
      name: 'help_center',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get invite_friends {
    return Intl.message(
      'Invite Friends',
      name: 'invite_friends',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `General Notifications`
  String get general_notifications {
    return Intl.message(
      'General Notifications',
      name: 'general_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Vibrate`
  String get vibrate {
    return Intl.message(
      'Vibrate',
      name: 'vibrate',
      desc: '',
      args: [],
    );
  }

  /// `Special Offers`
  String get special_offers {
    return Intl.message(
      'Special Offers',
      name: 'special_offers',
      desc: '',
      args: [],
    );
  }

  /// `Promo & Discount`
  String get promo_discount {
    return Intl.message(
      'Promo & Discount',
      name: 'promo_discount',
      desc: '',
      args: [],
    );
  }

  /// `Cashback`
  String get cashback {
    return Intl.message(
      'Cashback',
      name: 'cashback',
      desc: '',
      args: [],
    );
  }

  /// `App Updates`
  String get app_updates {
    return Intl.message(
      'App Updates',
      name: 'app_updates',
      desc: '',
      args: [],
    );
  }

  /// `New Service Available`
  String get new_service_available {
    return Intl.message(
      'New Service Available',
      name: 'new_service_available',
      desc: '',
      args: [],
    );
  }

  /// `New Tips Available`
  String get new_tips_available {
    return Intl.message(
      'New Tips Available',
      name: 'new_tips_available',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get connected {
    return Intl.message(
      'Connected',
      name: 'connected',
      desc: '',
      args: [],
    );
  }

  /// `Disconnected`
  String get disconnected {
    return Intl.message(
      'Disconnected',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get add_new_card {
    return Intl.message(
      'Add New Card',
      name: 'add_new_card',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get card_number {
    return Intl.message(
      'Card Number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiry_date {
    return Intl.message(
      'Expiry Date',
      name: 'expiry_date',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Card Name`
  String get card_name {
    return Intl.message(
      'Card Name',
      name: 'card_name',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get remember_me {
    return Intl.message(
      'Remember Me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Face ID`
  String get face_id {
    return Intl.message(
      'Face ID',
      name: 'face_id',
      desc: '',
      args: [],
    );
  }

  /// `Biometric ID`
  String get biometric_id {
    return Intl.message(
      'Biometric ID',
      name: 'biometric_id',
      desc: '',
      args: [],
    );
  }

  /// `Google Authenticator`
  String get google_auth {
    return Intl.message(
      'Google Authenticator',
      name: 'google_auth',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Change PIN`
  String get change_pin {
    return Intl.message(
      'Change PIN',
      name: 'change_pin',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logout_sentence {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logout_sentence',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Logout`
  String get yes_logout {
    return Intl.message(
      'Yes, Logout',
      name: 'yes_logout',
      desc: '',
      args: [],
    );
  }

  /// `No, Cancel`
  String get no_cancel {
    return Intl.message(
      'No, Cancel',
      name: 'no_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?l`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account ?',
      name: 'already have an account ?',
      desc: '',
      args: [],
    );
  }

    /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

    /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

    /// `Login to Your Account`
  String get login_to_your_account {
    return Intl.message(
      'Login to your\n account',
      name: 'login to your account',
      desc: '',
      args: [],
    );
  }

    /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign in',
      desc: '',
      args: [],
    );
  }

     /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign up',
      desc: '',
      args: [],
    );
  }

    /// `Forgot the password?`
  String get forgot_the_password {
    return Intl.message(
      'Forgot the password?',
      name: 'forgot the password?',
      desc: '',
      args: [],
    );
  }

    /// `Don\'t have an account?`
  String get dont_have_an_account{
    return Intl.message(
      'Don\'t have an account?',
      name: 'don\'t have an account?',
      desc: '',
      args: [],
    );
  }  

    /// `create Your account`
  String get create_your_account{
    return Intl.message(
      'Create your\n account',
      name: 'create your account',
      desc: '',
      args: [],
    );
  }  
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
