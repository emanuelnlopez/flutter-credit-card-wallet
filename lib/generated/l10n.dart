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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `My Cards`
  String get appName {
    return Intl.message(
      'My Cards',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get cardCompany {
    return Intl.message(
      'Company',
      name: 'cardCompany',
      desc: '',
      args: [],
    );
  }

  /// `Acme`
  String get cardCompanyHint {
    return Intl.message(
      'Acme',
      name: 'cardCompanyHint',
      desc: '',
      args: [],
    );
  }

  /// `Expiry`
  String get cardExpirationDate {
    return Intl.message(
      'Expiry',
      name: 'cardExpirationDate',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get cardExpirationDateHint {
    return Intl.message(
      'MM/YY',
      name: 'cardExpirationDateHint',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get cardHolderName {
    return Intl.message(
      'Cardholder Name',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `John Doe`
  String get cardHolderNameHint {
    return Intl.message(
      'John Doe',
      name: 'cardHolderNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message(
      'Card Number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `XXXX XXXX XXXX XXXX`
  String get cardNumberHint {
    return Intl.message(
      'XXXX XXXX XXXX XXXX',
      name: 'cardNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Credit`
  String get cardTypeCredit {
    return Intl.message(
      'Credit',
      name: 'cardTypeCredit',
      desc: '',
      args: [],
    );
  }

  /// `Debit`
  String get cardTypeDedit {
    return Intl.message(
      'Debit',
      name: 'cardTypeDedit',
      desc: '',
      args: [],
    );
  }

  /// `Prepaid`
  String get cardTypePrepaid {
    return Intl.message(
      'Prepaid',
      name: 'cardTypePrepaid',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cardVerificationValue {
    return Intl.message(
      'CVV',
      name: 'cardVerificationValue',
      desc: '',
      args: [],
    );
  }

  /// `XXX`
  String get cardVerificationValueHint {
    return Intl.message(
      'XXX',
      name: 'cardVerificationValueHint',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong happened. Please try again later.`
  String get errorMessage {
    return Intl.message(
      'Something wrong happened. Please try again later.',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Oops! something went wrong`
  String get errorTitle {
    return Intl.message(
      'Oops! something went wrong',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `New card`
  String get newCard {
    return Intl.message(
      'New card',
      name: 'newCard',
      desc: '',
      args: [],
    );
  }

  /// `Required value`
  String get requiredValue {
    return Intl.message(
      'Required value',
      name: 'requiredValue',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Debit, Credit or Prepaid`
  String get typeHint {
    return Intl.message(
      'Debit, Credit or Prepaid',
      name: 'typeHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
