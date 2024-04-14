class UserPlay {
  bool? success;
  String? message;
  List<Data>? data;

  UserPlay({this.success, this.message, this.data});

  UserPlay.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? gameWeek;
  int? points;
  String? createdAt;
  String? updatedAt;
  int? userId;

  Data(
      {this.id,
      this.gameWeek,
      this.points,
      this.createdAt,
      this.updatedAt,
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameWeek = json['gameWeek'];
    points = json['points'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gameWeek'] = gameWeek;
    data['points'] = points;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}