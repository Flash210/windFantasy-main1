



class GameWeek {
  int? id;
  int? gameWeek;
  int? points;
  String? createdAt;
  String? updatedAt;
  int? userId;

  GameWeek(
      {this.id,
        this.gameWeek,
        this.points,
        this.createdAt,
        this.updatedAt,
        this.userId});

  GameWeek.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameWeek = json['gameWeek'];
    points = json['points'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['gameWeek'] = gameWeek;
    data['points'] = points;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}