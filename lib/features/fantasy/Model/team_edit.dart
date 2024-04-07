class TeamEdit {
  List<int>? forwards;
  List<int>? midfielders;
  List<int>? defenders;
  List<int>? goalkeepers;
  int? moneyRemaining;
  int? playersSelected;

  TeamEdit({
    this.forwards,
    this.midfielders,
    this.defenders,
    this.goalkeepers,
    this.moneyRemaining,
    this.playersSelected,
  });

  factory TeamEdit.fromJson(Map<String, dynamic> json) {
    return TeamEdit(
      forwards: json['forwards'] != null
          ? List<int>.from(json['forwards'].map((x) => x as int))
          : null,
      midfielders: json['midfielders'] != null
          ? List<int>.from(json['midfielders'].map((x) => x as int))
          : null,
      defenders: json['defenders'] != null
          ? List<int>.from(json['defenders'].map((x) => x as int))
          : null,
      goalkeepers: json['goalkeepers'] != null
          ? List<int>.from(json['goalkeepers'].map((x) => x as int))
          : null,
      moneyRemaining: json['moneyRemaining'] as int?,
      playersSelected: json['playersSelected'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'forwards': forwards,
        'midfielders': midfielders,
        'defenders': defenders,
        'goalkeepers': goalkeepers,
        'moneyRemaining': moneyRemaining,
        'playersSelected': playersSelected,
      };
}
