import 'dart:convert';

import 'package:front/core/services/config.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/Model/user_play.dart';
import 'package:front/features/fantasy/helpers/player_helper.dart';
import 'package:front/features/fantasy/helpers/team_helper.dart';
import 'package:http/http.dart' as http;

class TeamService {
  Future<void> createTeam({required TeamEdit teamEdit}) async {
    final String? token = await getToken();
    final response = await postResponse(
        token: token,
        urlBaseUrl: AppConfig.kUserBaseUrl,
        urlEndPoint: AppConfig.kCreateTeam,
        teamEdit: teamEdit);
    if (response.statusCode == 200) {
    } else {
    }
  }

  Future<UserPlay> getUserPLay() async {
    final String? token = await getToken();

    final Response = await http.get(
      Uri.parse(AppConfig.kUserPlayerBaseUrl + "getAllUserPlay"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );
    if (Response.statusCode == 200) {
      return UserPlay.fromJson(json.decode(Response.body));
    } else {
      return UserPlay.fromJson(json.decode(Response.body));
    }
  }
}
