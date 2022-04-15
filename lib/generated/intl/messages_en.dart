// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("account"),
        "accountnum": MessageLookupByLibrary.simpleMessage("account number"),
        "enteraccount":
            MessageLookupByLibrary.simpleMessage("enter 4~20 words"),
        "enternick":
            MessageLookupByLibrary.simpleMessage("Textbox can\'t empty"),
        "enterpass": MessageLookupByLibrary.simpleMessage("enter 6~12 words"),
        "home": MessageLookupByLibrary.simpleMessage("home"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "message": MessageLookupByLibrary.simpleMessage("Message"),
        "mostView": MessageLookupByLibrary.simpleMessage("Most View"),
        "nickname": MessageLookupByLibrary.simpleMessage("Nickname"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "search": MessageLookupByLibrary.simpleMessage("search"),
        "searchResult": MessageLookupByLibrary.simpleMessage("Search Result"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "success": MessageLookupByLibrary.simpleMessage("Log in success."),
        "wrong": MessageLookupByLibrary.simpleMessage(
            "Your account or password is wrong."),
        "wrongformat":
            MessageLookupByLibrary.simpleMessage("Your format is wrong.")
      };
}
