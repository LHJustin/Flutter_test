class into {
  String? event;
  String? roomId;
  int? senderRole;
  Body? body;
  String? time;

  into({this.event, this.roomId, this.senderRole, this.body, this.time});

  into.fromJson(Map<String, dynamic> json) {
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
  EntryNotice? entryNotice;
  int? roomCount;
  int? realCount;
  UserInfos? userInfos;
  int? guardianCount;
  int? guardianSum;
  int? contributeSum;

  Body(
      {this.entryNotice,
        this.roomCount,
        this.realCount,
        this.userInfos,
        this.guardianCount,
        this.guardianSum,
        this.contributeSum});

  Body.fromJson(Map<String, dynamic> json) {
    entryNotice = json['entry_notice'] != null
        ? new EntryNotice.fromJson(json['entry_notice'])
        : null;
    roomCount = json['room_count'];
    realCount = json['real_count'];
    userInfos = json['user_infos'] != null
        ? new UserInfos.fromJson(json['user_infos'])
        : null;
    guardianCount = json['guardian_count'];
    guardianSum = json['guardian_sum'];
    contributeSum = json['contribute_sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entryNotice != null) {
      data['entry_notice'] = this.entryNotice!.toJson();
    }
    data['room_count'] = this.roomCount;
    data['real_count'] = this.realCount;
    if (this.userInfos != null) {
      data['user_infos'] = this.userInfos!.toJson();
    }
    data['guardian_count'] = this.guardianCount;
    data['guardian_sum'] = this.guardianSum;
    data['contribute_sum'] = this.contributeSum;
    return data;
  }
}

class EntryNotice {
  String? username;
  String? headPhoto;
  String? action;
  EntryBanner? entryBanner;

  EntryNotice({this.username, this.headPhoto, this.action, this.entryBanner});

  EntryNotice.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    headPhoto = json['head_photo'];
    action = json['action'];
    entryBanner = json['entry_banner'] != null
        ? new EntryBanner.fromJson(json['entry_banner'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['head_photo'] = this.headPhoto;
    data['action'] = this.action;
    if (this.entryBanner != null) {
      data['entry_banner'] = this.entryBanner!.toJson();
    }
    return data;
  }
}

class EntryBanner {
  String? presentType;
  String? imgUrl;
  String? mainBadge;

  EntryBanner(
      {this.presentType, this.imgUrl, this.mainBadge,});

  EntryBanner.fromJson(Map<String, dynamic> json) {
    presentType = json['present_type'];
    imgUrl = json['img_url'];
    mainBadge = json['main_badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['present_type'] = this.presentType;
    data['img_url'] = this.imgUrl;
    data['main_badge'] = this.mainBadge;
    return data;
  }
}

class UserInfos {
  Null? onlinelist;

  UserInfos({this.onlinelist});

  UserInfos.fromJson(Map<String, dynamic> json) {
    onlinelist = json['onlinelist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onlinelist'] = this.onlinelist;
    return data;
  }
}
