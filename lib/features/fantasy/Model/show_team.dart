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


      factory ShowTeam.fromJson(Map<String, dynamic> json) => ShowTeam(
        id: json["id"],
        playingInGameweeks: json["playing_in_gameweeks"],
        captain: json["captain"],
        viceCaptain: json["vice_captain"],
        gameweeks: json["gameweeks"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        userId: json["user_id"],
        playerId: json["player_id"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "playing_in_gameweeks": playingInGameweeks,
    "captain": captain,
    "vice_captain": viceCaptain,
    "gameweeks": gameweeks,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user_id": userId,
    "player_id": playerId,
  };
}

