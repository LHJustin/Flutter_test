import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class send {
  String? action;
  String? content;

  send({this.action, this.content});

  factory send.fromJson(Map<String, dynamic> json) => send(
    action : json['action'],
    content : json['content'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['content'] = this.content;
    return data;
  }
}
