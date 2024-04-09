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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PlayingInGameweeks'] = this.playingInGameweeks;
    data['captain'] = this.captain;
    data['viceCaptain'] = this.viceCaptain;
    data['gameweeks'] = this.gameweeks;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['playerId'] = this.playerId;
    return data;
  }
}