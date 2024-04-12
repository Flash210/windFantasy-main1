import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/Model/user_play.dart';
import 'package:front/features/fantasy/services/team_service.dart';

class TeamRepository {
  final TeamService teamService;
  TeamRepository({required this.teamService});

  Future<void> createTeam({required TeamEdit teamEdit}) async {
    return teamService.createTeam(
      teamEdit: teamEdit,
    );
  }


  Future<UserPlay> getUserPLay() async {
    return teamService.getUserPLay();
  }
}
