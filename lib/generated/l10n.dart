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

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `account`
  String get account {
    return Intl.message(
      'account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Most View`
  String get mostView {
    return Intl.message(
      'Most View',
      name: 'mostView',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `account number`
  String get accountnum {
    return Intl.message(
      'account number',
      name: 'accountnum',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `enter 4~20 words`
  String get enteraccount {
    return Intl.message(
      'enter 4~20 words',
      name: 'enteraccount',
      desc: '',
      args: [],
    );
  }

  /// `enter 6~12 words`
  String get enterpass {
    return Intl.message(
      'enter 6~12 words',
      name: 'enterpass',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Your account or password is wrong.`
  String get wrong {
    return Intl.message(
      'Your account or password is wrong.',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get nickname {
    return Intl.message(
      'Nickname',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `Textbox can't empty`
  String get enternick {
    return Intl.message(
      'Textbox can\'t empty',
      name: 'enternick',
      desc: '',
      args: [],
    );
  }

  /// `Your format is wrong.`
  String get wrongformat {
    return Intl.message(
      'Your format is wrong.',
      name: 'wrongformat',
      desc: '',
      args: [],
    );
  }

  /// `Log in success.`
  String get success {
    return Intl.message(
      'Log in success.',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Take Picture`
  String get takePicture {
    return Intl.message(
      'Take Picture',
      name: 'takePicture',
      desc: '',
      args: [],
    );
  }

  /// `from photos`
  String get fromPhoto {
    return Intl.message(
      'from photos',
      name: 'fromPhoto',
      desc: '',
      args: [],
    );
  }

  /// `take a photo`
  String get takeAPhoto {
    return Intl.message(
      'take a photo',
      name: 'takeAPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `send message`
  String get sendMessage {
    return Intl.message(
      'send message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to leave?`
  String get sureleave {
    return Intl.message(
      'Are you sure to leave?',
      name: 'sureleave',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// ` enter the room.`
  String get enter {
    return Intl.message(
      ' enter the room.',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// ` leave the room.`
  String get leave {
    return Intl.message(
      ' leave the room.',
      name: 'leave',
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
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
