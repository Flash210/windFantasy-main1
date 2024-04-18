class UserModel {
  final bool success;
  final String message;
  final UserData data;

  const UserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json['success'] as bool,
        message: json['message'] as String,
        data: UserData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class UserData {
  final int id;

  final String name;
  final int phone;
  final String userRole;
  final String teamName;
  final int playersSelected;
  final int bank;
  final int freeTransfert;
  final int points;

  const UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.userRole,
    required this.teamName,
    required this.playersSelected,
    required this.bank,
    required this.freeTransfert,
    required this.points,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'] as int,
        name: json['name'] as String,
        phone: json['phone'] as int,
        userRole: json['userRole'] as String,
        teamName: json['teamName'] as String,
        playersSelected: json['playersSelected'] as int,
        bank: json['bank'] as int,
        freeTransfert: json['free_transfert'] as int,
        points: json['points'] as int,
      );
}
