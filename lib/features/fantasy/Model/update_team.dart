class UpdateTeam {
  final int? id;
  final int? playerId;
  final int? userId;
  final String? playingInGameweeks;
  final String? captain;
  final String? viceCaptain;

  UpdateTeam({
    required this.id,
    required this.playerId,
    required this.userId,
    required this.playingInGameweeks,
    required this.captain,
    required this.viceCaptain,
  });

  factory UpdateTeam.fromJson(Map<String, dynamic> json) => UpdateTeam(
        id: json['id'] ?? 0,
        playerId: json['playerId'] ?? 0,
        userId: json['userId'] ?? 0,
        playingInGameweeks: json['PlayingInGameweeks'] ?? '',
        captain: json['captain'] ?? '',
        viceCaptain: json['viceCaptain'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'playerId': playerId,
        'userId': userId,
        'PlayingInGameweeks': playingInGameweeks,
        'captain': captain,
        'viceCaptain': viceCaptain,
      };
}
