class Update {
  final int id;
  final int playerId;
  final int userId;
  final List<int>? playingInGameweeks;
  final List<int>? captain;
  final List<int>? viceCaptain;

  Update({
    required this.id,
    required this.playerId,
    required this.userId,
    this.playingInGameweeks,
    this.captain,
    this.viceCaptain,
  });

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      id: json['id'] as int,
      playerId: json['playerId'] as int,
      userId: json['userId'] as int,
      playingInGameweeks: (json['playingInGameweeks'] as List?)?.cast<int>(),
      captain: (json['captain'] as List?)?.cast<int>(),
      viceCaptain: (json['viceCaptain'] as List?)?.cast<int>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playerId': playerId,
      'userId': userId,
      'playingInGameweeks': playingInGameweeks,
      'captain': captain,
      'viceCaptain': viceCaptain,
    };
  }
}
