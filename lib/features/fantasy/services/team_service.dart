import 'package:front/core/services/config.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/helpers/player_helper.dart';
import 'package:front/features/fantasy/helpers/team_helper.dart';

class TeamService {
  Future<void> createTeam({required TeamEdit teamEdit}) async {
    final String? token = await getToken();
    final response = await postResponse(
        token: token,
        urlBaseUrl: AppConfig.kUserBaseUrl,
        urlEndPoint: AppConfig.kCreateTeam,
        teamEdit: teamEdit);
    if (response.statusCode == 200) {
      print("Team Created");
      
    } else {
      print("Team Not Created");
      print(response.body);
    }
  }
}
