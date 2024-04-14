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