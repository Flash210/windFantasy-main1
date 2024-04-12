import 'package:front/core/services/config.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/helpers/player_helper.dart';

class PlayerApiService {


  Future<List<Player>> fetchPlayers() async {
    final String? token = await getToken();
    final response = await getResponse(
        token: token,
        urlBaseUrl: AppConfig.kPlayerBaseUrl,
        urlEndPoint: AppConfig.kGetAllPlayers);
    return parseListResponse1<Player>(
        response, (jsonData) => Player.fromJson(jsonData));
  }

  Future<List<Team>> fetchTeams() async {
    final String? token = await getToken();
    final response = await getResponse(
        token: token,
        urlBaseUrl: AppConfig.kTeamBaseUrl,
        urlEndPoint: AppConfig.kGetAllTeams);
    return parseListResponse1<Team>(
        response, (jsonData) => Team.fromJson(jsonData));
  }
}
