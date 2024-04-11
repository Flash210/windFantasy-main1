import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/services/player_service.dart';


class PlayerRepository {
  final PlayerApiService _playerApiService;

  PlayerRepository(this._playerApiService);




  Future<List<Player>> fetchPlayers() async {
    return _playerApiService.fetchPlayers();
  }



Future<List<Team>> fetchTeams() async {
  return _playerApiService.fetchTeams();
}


  
}
