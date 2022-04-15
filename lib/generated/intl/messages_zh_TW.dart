// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("會員"),
        "accountnum": MessageLookupByLibrary.simpleMessage("帳號"),
        "enteraccount": MessageLookupByLibrary.simpleMessage("輸入4~20個字"),
        "enternick": MessageLookupByLibrary.simpleMessage("內容不能是空的"),
        "enterpass": MessageLookupByLibrary.simpleMessage("輸入6~12個字"),
        "home": MessageLookupByLibrary.simpleMessage("首頁"),
        "logIn": MessageLookupByLibrary.simpleMessage("登入"),
        "message": MessageLookupByLibrary.simpleMessage("訊息提示"),
        "mostView": MessageLookupByLibrary.simpleMessage("熱門影片"),
        "nickname": MessageLookupByLibrary.simpleMessage("暱稱"),
        "password": MessageLookupByLibrary.simpleMessage("密碼"),
        "search": MessageLookupByLibrary.simpleMessage("搜尋"),
        "searchResult": MessageLookupByLibrary.simpleMessage("搜尋結果"),
        "signUp": MessageLookupByLibrary.simpleMessage("註冊"),
        "success": MessageLookupByLibrary.simpleMessage("登入成功。"),
        "wrong": MessageLookupByLibrary.simpleMessage("你的帳號或密碼可能錯誤。"),
        "wrongformat": MessageLookupByLibrary.simpleMessage("你的格式錯誤。")
      };
}
