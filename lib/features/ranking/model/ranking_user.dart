class UserRank {
  int? numberOfUser;
  int? rank;

  UserRank({this.numberOfUser, this.rank});

  factory UserRank.fromJson(Map<String, dynamic> json) {
    return UserRank(
      numberOfUser: json['numberOfUser'],
      rank: json['rank'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numberOfUser'] = numberOfUser;
    data['rank'] = rank;
    return data;
  }
}