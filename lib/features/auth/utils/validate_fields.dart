import 'package:flutter/material.dart';
import 'package:front/generated/l10n.dart';

String? validatePhoneNumber(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).kPhoneEmptyError;
  }

  if (value.length != 8) {
    return S.of(context).kPhoneLengthError;
  }

  if (value.startsWith('0')) {
    return S.of(context).kPhoneStartsWithZeroError;
  }
  return null;
  // Return null if validation passes
}

String? validateEmail(String? value, BuildContext context) {
  if (value!.isEmpty) {
    return S.of(context).kEmailEmptyError;
  }

  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return S.of(context).kEmailFormatError;
  }

  if (value.startsWith(RegExp(r'[0-9]'))) {
    return S.of(context).kEmailNameStartsWithNumberError;
  }
  return null;
}

// name
String? validateName(String? value, BuildContext context) {
  if (value!.isEmpty) {
    return S.of(context).kNameEmptyError;
  }

  if (value.startsWith(RegExp(r'[0-9]'))) {
    return S.of(context).kNameStartsWithNumberError;
  }

  if (value.contains(RegExp(r'[0-9]'))) {
    return S.of(context).kNameContainsNumberError;
  }
  return null;



}

// Team Name
String? validateTeamName(String? value, BuildContext context) {
  if (value!.isEmpty) {
    return S.of(context).kTeamNameEmptyError;
  }

  if (value.startsWith(RegExp(r'[0-9]'))) {
    return S.of(context).kTeamNameStartsWithNumberError;
  }

  if (value.contains(RegExp(r'[0-9]'))) {
    return S.of(context).kTeamNameContainsNumberError;
  }
  return null;
}

String? validatePassword(String? value, BuildContext context) {
  if (value!.isEmpty) {
    return S.of(context).kPasswordEmptyError;
  }

  if (value.length < 8) {
    return S.of(context).kPasswordLengthError;
  }

  final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
  if (!uppercaseRegExp.hasMatch(value)) {
    return S.of(context).kPasswordUppercaseError;
  }

  final RegExp lowercaseRegExp = RegExp(r'[a-z]');
  if (!lowercaseRegExp.hasMatch(value)) {
    return S.of(context).kPasswordLowercaseError;
  }

  final RegExp digitRegExp = RegExp(r'[0-9]');
  if (!digitRegExp.hasMatch(value)) {
    return S.of(context).kPasswordNumberError;
  }

  // final RegExp symbolRegExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
  // if (!symbolRegExp.hasMatch(value)) {

  //   return S.of(context).kPasswordSymbolError;
  // }
  return null;
}
