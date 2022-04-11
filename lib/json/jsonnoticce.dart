class notice {
  String? event;
  String? roomId;
  int? senderRole;
  Body? body;
  String? time;

  notice({this.event, this.roomId, this.senderRole, this.body, this.time});

  notice.fromJson(Map<String, dynamic> json) {
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
  Content? content;

  Body({this.content});

  Body.fromJson(Map<String, dynamic> json) {
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    return data;
  }
}

class Content {
  String? cn;
  String? en;
  String? tw;

  Content({this.cn, this.en, this.tw});

  Content.fromJson(Map<String, dynamic> json) {
    cn = json['cn'];
    en = json['en'];
    tw = json['tw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cn'] = this.cn;
    data['en'] = this.en;
    data['tw'] = this.tw;
    return data;
  }
}
