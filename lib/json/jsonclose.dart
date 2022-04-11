class close {
  String? event;
  String? roomId;
  int? senderRole;
  Body? body;
  String? time;

  close({this.event, this.roomId, this.senderRole, this.body, this.time});

  close.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    roomId = json['room_id'];
    senderRole = json['sender_role'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['room_id'] = this.roomId;
    data['sender_role'] = this.senderRole;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Body {
  String? type;
  String? text;

  Body({this.type, this.text});

  Body.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['text'] = this.text;
    return data;
  }
}
