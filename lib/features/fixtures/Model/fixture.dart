class Fixture {
  int? id;
  int? gameWeek;
  String? date;
  String? result;
  int? resultHome;
  int? resultAway;
  String? createdAt;
  String? updatedAt;
  int? homeTeamId;
  int? awayTeamId;

  Fixture(
      {this.id,
      this.gameWeek,
      this.date,
      this.result,
      this.resultHome,
      this.resultAway,
      this.createdAt,
      this.updatedAt,
      this.homeTeamId,
      this.awayTeamId});

 factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['id'] ?? 0 ,
      gameWeek: json['gameWeek'] ?? 0,
      date: json['date'] ?? '',
      result: json['result'] ?? '',
      resultHome: json['resultHome'] ?? 0,
      resultAway: json['resultAway'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      homeTeamId: json['homeTeamId'] ?? 0,
      awayTeamId: json['awayTeamId']  ?? 0,
    );
  }

 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gameWeek'] = gameWeek;
    data['date'] = date;
    data['result'] = result;
    data['resultHome'] = resultHome;
    data['resultAway'] = resultAway;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['homeTeamId'] = homeTeamId;
    data['awayTeamId'] = awayTeamId;
    return data;
  }
}