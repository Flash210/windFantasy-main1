class Team {
  int? id;
  String? name;
  String? logo;
  String? imageGoalkeeper;
  String? imagePlayer;
  String? createdAt;
  String? updatedAt;

  Team(
      {this.id,
      this.name,
      this.logo,
      this.imageGoalkeeper,
      this.imagePlayer,
      this.createdAt,
      this.updatedAt});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      imageGoalkeeper: json['imageGoalkeeper'] ?? '',
      imagePlayer: json['imagePlayer'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'imageGoalkeeper': imageGoalkeeper,
      'imagePlayer': imagePlayer,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
