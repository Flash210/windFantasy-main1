class ShowTeam {
  int? id;
  String? playingInGameweeks;
  String? captain;
  String? viceCaptain;
  String? gameweeks;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? playerId;

  ShowTeam(
      {this.id,
      this.playingInGameweeks,
      this.captain,
      this.viceCaptain,
      this.gameweeks,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.playerId});

 factory ShowTeam.fromJson(Map<String, dynamic> json) {
    return ShowTeam(
      id: json['id'] ?? "",
      playingInGameweeks: json['PlayingInGameweeks'] ?? "",
      captain: json['captain'] ?? "",
      viceCaptain: json['viceCaptain'] ?? "",
      gameweeks: json['gameweeks'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      userId: json['userId']  ?? "",
      playerId: json['playerId'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['PlayingInGameweeks'] = playingInGameweeks;
    data['captain'] = captain;
    data['viceCaptain'] = viceCaptain;
    data['gameweeks'] = gameweeks;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['playerId'] = playerId;
    return data;
  }
}





/*
class ShowTeam {
  int? id;
  List<String>? playingInGameweeks;
  List<String>? captain;
  List<String>? viceCaptain;
  List<String>? gameweeks;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? playerId;

  ShowTeam({
    this.id,
    this.playingInGameweeks,
    this.captain,
    this.viceCaptain,
    this.gameweeks,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.playerId,
  });

  factory ShowTeam.fromJson(Map<String, dynamic> json) {
    return ShowTeam(
      id: json['id'],
      playingInGameweeks: json['PlayingInGameweeks'] != null
          ? json['PlayingInGameweeks'] is List
              ? List<String>.from(json['PlayingInGameweeks'].map((x) => x))
              : [json['PlayingInGameweeks'] as String]
          : null,
      captain: json['captain'] != null
          ? json['captain'] is List
              ? List<String>.from(json['captain'].map((x) => x))
              : [json['captain'] as String]
          : null,
      viceCaptain: json['viceCaptain'] != null
          ? json['viceCaptain'] is List
              ? List<String>.from(json['viceCaptain'].map((x) => x))
              : [json['viceCaptain'] as String]
          : null,
      gameweeks: json['gameweeks'] != null
          ? json['gameweeks'] is List
              ? List<String>.from(json['gameweeks'].map((x) => x))
              : [json['gameweeks'] as String]
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userId: json['userId'],
      playerId: json['playerId'],
    );
  }

 
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['PlayingInGameweeks'] = playingInGameweeks;
    data['captain'] = captain;
    data['viceCaptain'] = viceCaptain ;
    data['gameweeks'] = gameweeks;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['playerId'] = playerId;
    return data;
  }
}*/