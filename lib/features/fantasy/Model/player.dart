class Player {
  final int id;
  final String name;
  final String position;
  final int price;
  final int totalMatchesPlayed;
  final int totalPoints;
  final int totalGoals;
  final int totalAssists;
  final int totalRedCard;
  final int totalYellowCard;
  final int totalOwnGoals;
  final int totalCleanSheet;
  final int totalManOfTheMatch;
  final int totalMissedPenalties;
  final String createdAt;
  final String updatedAt;
  final int teamId;

 Player.empty()
      : id = 0,
        name = '',
        position = '',
        price = 0,
        totalMatchesPlayed = 0,
        totalPoints = 0,
        totalGoals = 0,
        totalAssists = 0,
        totalRedCard = 0,
        totalYellowCard = 0,
        totalOwnGoals = 0,
        totalCleanSheet = 0,
        totalManOfTheMatch = 0,
        totalMissedPenalties = 0,
        createdAt = '',
        updatedAt = '',
        teamId = 0;
  

  

  Player({
    required this.id,
    required this.name,
    required this.position,
    required this.price,
    required this.totalMatchesPlayed,
    required this.totalPoints,
    required this.totalGoals,
    required this.totalAssists,
    required this.totalRedCard,
    required this.totalYellowCard,
    required this.totalOwnGoals,
    required this.totalCleanSheet,
    required this.totalManOfTheMatch,
    required this.totalMissedPenalties,
    required this.createdAt,
    required this.updatedAt,
    required this.teamId,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      price: json['price'] ?? 0,
      totalMatchesPlayed: json['totalMatchesPlayed'] ?? 0,
      totalPoints: json['totalPoints'] ?? 0,
      totalGoals: json['totalGoals'] ?? 0,
      totalAssists: json['totalAssists'] ?? 0,
      totalRedCard: json['totalRedCard'] ?? 0,
      totalYellowCard: json['totalYellowCard'] ?? 0,
      totalOwnGoals: json['totalOwnGoals'] ?? 0,
      totalCleanSheet: json['totalCleanSheet'] ?? 0,
      totalManOfTheMatch: json['totalManOfTheMatch'] ?? 0,
      totalMissedPenalties: json['totalMissedPenalties'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      teamId: json['teamId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'price': price,
      'totalMatchesPlayed': totalMatchesPlayed,
      'totalPoints': totalPoints,
      'totalGoals': totalGoals,
      'totalAssists': totalAssists,
      'totalRedCard': totalRedCard,
      'totalYellowCard': totalYellowCard,
      'totalOwnGoals': totalOwnGoals,
      'totalCleanSheet': totalCleanSheet,
      'totalManOfTheMatch': totalManOfTheMatch,
      'totalMissedPenalties': totalMissedPenalties,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'teamId': teamId,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          position == other.position &&
          price == other.price &&
          totalMatchesPlayed == other.totalMatchesPlayed &&
          totalPoints == other.totalPoints &&
          totalGoals == other.totalGoals &&
          totalAssists == other.totalAssists &&
          totalRedCard == other.totalRedCard &&
          totalYellowCard == other.totalYellowCard &&
          totalOwnGoals == other.totalOwnGoals &&
          totalCleanSheet == other.totalCleanSheet &&
          totalManOfTheMatch == other.totalManOfTheMatch &&
          totalMissedPenalties == other.totalMissedPenalties &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          teamId == other.teamId;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      position.hashCode ^
      price.hashCode ^
      totalMatchesPlayed.hashCode ^
      totalPoints.hashCode ^
      totalGoals.hashCode ^
      totalAssists.hashCode ^
      totalRedCard.hashCode ^
      totalYellowCard.hashCode ^
      totalOwnGoals.hashCode ^
      totalCleanSheet.hashCode ^
      totalManOfTheMatch.hashCode ^
      totalMissedPenalties.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      teamId.hashCode;
}
