
class TopUser {
  bool? success;
  String? message;
  Data? data;

  TopUser({this.success, this.message, this.data});

 factory  TopUser.fromJson(Map<String, dynamic> json) {
    return TopUser(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }


  Map toJson() {
    return {
      'success': success,
      'message': message,
      'data': data!.toJson(),
    };
  }
}

class Data {
  List<Team>? team;
  int? userId;
  int? hegihtPoints;
  int? rank;
  String? name;
  String? teamName;
  int? bank;
  int? points;
  int? overAllRank;
  int? transferCount;
  int? nombreOfTransferInGW;

  Data(
      {this.team,
        this.userId,
        this.hegihtPoints,
        this.rank,
        this.name,
        this.teamName,
        this.bank,
        this.points,
        this.overAllRank,
        this.transferCount,
        this.nombreOfTransferInGW});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }
    userId = json['userId'];
    hegihtPoints = json['hegihtPoints'];
    rank = json['rank'];
    name = json['name'];
    teamName = json['teamName'];
    bank = json['bank'];
    points = json['points'];
    overAllRank = json['overAllRank'];
    transferCount = json['transferCount'];
    nombreOfTransferInGW = json['nombreOfTransferInGW'];
  }


  Map toJson() {
    return {
      'team': team!.map((e) => e.toJson()).toList(),
      'userId': userId,
      'hegihtPoints': hegihtPoints,
      'rank': rank,
      'name': name,
      'teamName': teamName,
      'bank': bank,
      'points': points,
      'overAllRank': overAllRank,
      'transferCount': transferCount,
      'nombreOfTransferInGW': nombreOfTransferInGW,
    };
  }
}

class Team {
  int? id;
  String? playingInGameweeks;
  String? captain;
  String? viceCaptain;
  String? gameweeks;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? playerId;

  Team(
      {this.id,
        this.playingInGameweeks,
        this.captain,
        this.viceCaptain,
        this.gameweeks,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.playerId});


  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      playingInGameweeks: json['PlayingInGameweeks'],
      captain: json['captain'],
      viceCaptain: json['viceCaptain'],
      gameweeks: json['gameweeks'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
      playerId: json['playerId'],
    );
  }
Map toJson() {
    return {
      'id': id,
      'playingInGameweeks': playingInGameweeks,
      'captain': captain,
      'viceCaptain': viceCaptain,
      'gameweeks': gameweeks,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
      'playerId': playerId,
    };
  }
}