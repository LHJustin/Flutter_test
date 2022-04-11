class message {
  String? event;
  String? roomId;
  Body? body;
  String? time;

  message({this.event, this.roomId, this.body, this.time});

  message.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    roomId = json['room_id'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['room_id'] = this.roomId;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Body {
  String? chatId;
  String? account;
  String? nickname;
  String? recipient;
  String? type;
  String? text;
  String? acceptTime;
  Info? info;

  Body(
      {this.chatId,
        this.account,
        this.nickname,
        this.recipient,
        this.type,
        this.text,
        this.acceptTime,
        this.info});

  Body.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    account = json['account'];
    nickname = json['nickname'];
    recipient = json['recipient'];
    type = json['type'];
    text = json['text'];
    acceptTime = json['accept_time'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['account'] = this.account;
    data['nickname'] = this.nickname;
    data['recipient'] = this.recipient;
    data['type'] = this.type;
    data['text'] = this.text;
    data['accept_time'] = this.acceptTime;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Info {
  int? lastLogin;
  int? isBan;
  int? level;
  int? isGuardian;
  Null? badges;

  Info({this.lastLogin, this.isBan, this.level, this.isGuardian, this.badges});

  Info.fromJson(Map<String, dynamic> json) {
    lastLogin = json['last_login'];
    isBan = json['is_ban'];
    level = json['level'];
    isGuardian = json['is_guardian'];
    badges = json['badges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_login'] = this.lastLogin;
    data['is_ban'] = this.isBan;
    data['level'] = this.level;
    data['is_guardian'] = this.isGuardian;
    data['badges'] = this.badges;
    return data;
  }
}