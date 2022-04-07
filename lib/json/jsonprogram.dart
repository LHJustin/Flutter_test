class program {
  String? errorCode;
  String? errorText;
  Result? result;

  program({this.errorCode, this.errorText, this.result});

  program.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    errorText = json['error_text'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['error_text'] = this.errorText;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<LightyearList>? lightyearList;
  List<StreamList>? streamList;

  Result({this.lightyearList, this.streamList});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['lightyear_list'] != null) {
      lightyearList = <LightyearList>[];
      json['lightyear_list'].forEach((v) {
        lightyearList!.add(new LightyearList.fromJson(v));
      });
    }
    if (json['stream_list'] != null) {
      streamList = <StreamList>[];
      json['stream_list'].forEach((v) {
        streamList!.add(new StreamList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lightyearList != null) {
      data['lightyear_list'] =
          this.lightyearList!.map((v) => v.toJson()).toList();
    }
    if (this.streamList != null) {
      data['stream_list'] = this.streamList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StreamList {
  int? streamId;
  int? streamerId;
  String? streamTitle;
  int? status;
  int? openAt;
  int? closedAt;
  int? deletedAt;
  int? startTime;
  String? nickname;
  String? headPhoto;
  String? tags;
  int? onlineNum;
  String? game;
  int? charge;
  int? groupId;
  String? backgroundImage;
  bool? openAttention;
  bool? openGuardians;

  StreamList(
      {this.streamId,
        this.streamerId,
        this.streamTitle,
        this.status,
        this.openAt,
        this.closedAt,
        this.deletedAt,
        this.startTime,
        this.nickname,
        this.headPhoto,
        this.tags,
        this.onlineNum,
        this.game,
        this.charge,
        this.groupId,
        this.backgroundImage,
        this.openAttention,
        this.openGuardians});

  StreamList.fromJson(Map<String, dynamic> json) {
    streamId = json['stream_id'];
    streamerId = json['streamer_id'];
    streamTitle = json['stream_title'];
    status = json['status'];
    openAt = json['open_at'];
    closedAt = json['closed_at'];
    deletedAt = json['deleted_at'];
    startTime = json['start_time'];
    nickname = json['nickname'];
    headPhoto = json['head_photo'];
    tags = json['tags'];
    onlineNum = json['online_num'];
    game = json['game'];
    charge = json['charge'];
    groupId = json['group_id'];
    backgroundImage = json['background_image'];
    openAttention = json['open_attention'];
    openGuardians = json['open_guardians'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stream_id'] = this.streamId;
    data['streamer_id'] = this.streamerId;
    data['stream_title'] = this.streamTitle;
    data['status'] = this.status;
    data['open_at'] = this.openAt;
    data['closed_at'] = this.closedAt;
    data['deleted_at'] = this.deletedAt;
    data['start_time'] = this.startTime;
    data['nickname'] = this.nickname;
    data['head_photo'] = this.headPhoto;
    data['tags'] = this.tags;
    data['online_num'] = this.onlineNum;
    data['game'] = this.game;
    data['charge'] = this.charge;
    data['group_id'] = this.groupId;
    data['background_image'] = this.backgroundImage;
    data['open_attention'] = this.openAttention;
    data['open_guardians'] = this.openGuardians;
    return data;
  }
}

class LightyearList {
  int? streamId;
  int? streamerId;
  String? streamTitle;
  int? status;
  int? openAt;
  int? closedAt;
  int? deletedAt;
  int? startTime;
  String? nickname;
  String? headPhoto;
  String? tags;
  int? onlineNum;
  String? game;
  int? charge;
  int? groupId;
  String? backgroundImage;
  bool? openAttention;
  bool? openGuardians;

  LightyearList(
      {this.streamId,
        this.streamerId,
        this.streamTitle,
        this.status,
        this.openAt,
        this.closedAt,
        this.deletedAt,
        this.startTime,
        this.nickname,
        this.headPhoto,
        this.tags,
        this.onlineNum,
        this.game,
        this.charge,
        this.groupId,
        this.backgroundImage,
        this.openAttention,
        this.openGuardians});

  LightyearList.fromJson(Map<String, dynamic> json) {
    streamId = json['stream_id'];
    streamerId = json['streamer_id'];
    streamTitle = json['stream_title'];
    status = json['status'];
    openAt = json['open_at'];
    closedAt = json['closed_at'];
    deletedAt = json['deleted_at'];
    startTime = json['start_time'];
    nickname = json['nickname'];
    headPhoto = json['head_photo'];
    tags = json['tags'];
    onlineNum = json['online_num'];
    game = json['game'];
    charge = json['charge'];
    groupId = json['group_id'];
    backgroundImage = json['background_image'];
    openAttention = json['open_attention'];
    openGuardians = json['open_guardians'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stream_id'] = this.streamId;
    data['streamer_id'] = this.streamerId;
    data['stream_title'] = this.streamTitle;
    data['status'] = this.status;
    data['open_at'] = this.openAt;
    data['closed_at'] = this.closedAt;
    data['deleted_at'] = this.deletedAt;
    data['start_time'] = this.startTime;
    data['nickname'] = this.nickname;
    data['head_photo'] = this.headPhoto;
    data['tags'] = this.tags;
    data['online_num'] = this.onlineNum;
    data['game'] = this.game;
    data['charge'] = this.charge;
    data['group_id'] = this.groupId;
    data['background_image'] = this.backgroundImage;
    data['open_attention'] = this.openAttention;
    data['open_guardians'] = this.openGuardians;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'stream_id: $streamId, hiurfhuirhfiuhhrhu';
  }
}
