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

  /// `Welcome to \n WindFantasy App`
  String get WelcomeSection {
    return Intl.message(
      'Welcome to \n WindFantasy App',
      name: 'WelcomeSection',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and password \nto use the application`
  String get WelcomeSubSection {
    return Intl.message(
      'Enter your email address and password \nto use the application',
      name: 'WelcomeSubSection',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get SignIn {
    return Intl.message(
      'Sign In',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get NameAndSurname {
    return Intl.message(
      'Name',
      name: 'NameAndSurname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Team Name`
  String get TeamName {
    return Intl.message(
      'Team Name',
      name: 'TeamName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Powered by Wind Consulting`
  String get PowredBy {
    return Intl.message(
      'Powered by Wind Consulting',
      name: 'PowredBy',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get RememberMe {
    return Intl.message(
      'Remember Me',
      name: 'RememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get ConfirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'ConfirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPasswordBtn {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPasswordBtn',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get EnterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'EnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Come Back For Connect`
  String get ComeBackForConnect {
    return Intl.message(
      'Come Back For Connect',
      name: 'ComeBackForConnect',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get EnterYourNewPassword {
    return Intl.message(
      'Enter Your New Password',
      name: 'EnterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `GameWeek`
  String get GameWeek {
    return Intl.message(
      'GameWeek',
      name: 'GameWeek',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get kPhoneEmptyError {
    return Intl.message(
      'Please enter your phone number',
      name: 'kPhoneEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be 8 digits`
  String get kPhoneLengthError {
    return Intl.message(
      'Phone number must be 8 digits',
      name: 'kPhoneLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get kEmailEmptyError {
    return Intl.message(
      'Please enter your email',
      name: 'kEmailEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get kEmailFormatError {
    return Intl.message(
      'Please enter a valid email',
      name: 'kEmailFormatError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get kNameEmptyError {
    return Intl.message(
      'Please enter your name',
      name: 'kNameEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Team Name`
  String get kTeamNameEmptyError {
    return Intl.message(
      'Please enter your Team Name',
      name: 'kTeamNameEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Name should not start with a number`
  String get kNameStartsWithNumberError {
    return Intl.message(
      'Name should not start with a number',
      name: 'kNameStartsWithNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Team Name should not start with a number`
  String get kTeamNameStartsWithNumberError {
    return Intl.message(
      'Team Name should not start with a number',
      name: 'kTeamNameStartsWithNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Email should not start with a number`
  String get kEmailNameStartsWithNumberError {
    return Intl.message(
      'Email should not start with a number',
      name: 'kEmailNameStartsWithNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Name should not contain a number`
  String get kNameContainsNumberError {
    return Intl.message(
      'Name should not contain a number',
      name: 'kNameContainsNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Team Name should not contain a number`
  String get kTeamNameContainsNumberError {
    return Intl.message(
      'Team Name should not contain a number',
      name: 'kTeamNameContainsNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get kPasswordEmptyError {
    return Intl.message(
      'Please enter your password',
      name: 'kPasswordEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get kPasswordLengthError {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'kPasswordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get kPasswordUppercaseError {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'kPasswordUppercaseError',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get kPasswordLowercaseError {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'kPasswordLowercaseError',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get kPasswordNumberError {
    return Intl.message(
      'Password must contain at least one number',
      name: 'kPasswordNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one symbol`
  String get kPasswordSymbolError {
    return Intl.message(
      'Password must contain at least one symbol',
      name: 'kPasswordSymbolError',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must not start with 0`
  String get kPhoneStartsWithZeroError {
    return Intl.message(
      'Phone number must not start with 0',
      name: 'kPhoneStartsWithZeroError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign up. Please try again.`
  String get FailedToSignUp {
    return Intl.message(
      'Failed to sign up. Please try again.',
      name: 'FailedToSignUp',
      desc: '',
      args: [],
    );
  }

  /// `GoalKeeper`
  String get GoalKepper {
    return Intl.message(
      'GoalKeeper',
      name: 'GoalKepper',
      desc: '',
      args: [],
    );
  }

  /// `Defender`
  String get Defender {
    return Intl.message(
      'Defender',
      name: 'Defender',
      desc: '',
      args: [],
    );
  }

  /// `Midfildier`
  String get Midfildier {
    return Intl.message(
      'Midfildier',
      name: 'Midfildier',
      desc: '',
      args: [],
    );
  }

  /// `Forward`
  String get Forward {
    return Intl.message(
      'Forward',
      name: 'Forward',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get Apply {
    return Intl.message(
      'Apply',
      name: 'Apply',
      desc: '',
      args: [],
    );
  }

  /// `Team `
  String get Team {
    return Intl.message(
      'Team ',
      name: 'Team',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get PriceRange {
    return Intl.message(
      'Price Range',
      name: 'PriceRange',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get Reset {
    return Intl.message(
      'Reset',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information `
  String get PersonalInfo {
    return Intl.message(
      'Personal Information ',
      name: 'PersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Notifications `
  String get Notif {
    return Intl.message(
      'Notifications ',
      name: 'Notif',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get LogOut {
    return Intl.message(
      'LogOut',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get AreYouSure {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'AreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Langue {
    return Intl.message(
      'Language',
      name: 'Langue',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get Filter {
    return Intl.message(
      'Filter',
      name: 'Filter',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get NameOfPlayer {
    return Intl.message(
      'Name: ',
      name: 'NameOfPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Team: `
  String get Team1 {
    return Intl.message(
      'Team: ',
      name: 'Team1',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get Budget {
    return Intl.message(
      'Budget',
      name: 'Budget',
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
      Locale.fromSubtags(languageCode: 'fr'),
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
