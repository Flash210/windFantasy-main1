import 'package:front/core/constants/app_constants.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/team_section.dart';
import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:provider/provider.dart';

buildCreationTeam({required int playerSelected, required List<ShowTeam> listOfFantasyPlayers}) {
    return
        Consumer<PlayerProvider>(
          builder: (context, playerProvider, child) {
            final slectedPlayerFromMap = playerProvider.selectedPlayersMap;

            final List<int> forwards = [
              slectedPlayerFromMap["Attaquant1"]?.id ?? 0,
              slectedPlayerFromMap["bench1"]?.id ?? 0,
              slectedPlayerFromMap["Attaquant2"]?.id ?? 0,
            ];

            final List<int> midfielders = [
              slectedPlayerFromMap["bench2"]?.id ?? 0,
              slectedPlayerFromMap["Milieu1"]?.id ?? 0,
              slectedPlayerFromMap["Milieu2"]?.id ?? 0,
              slectedPlayerFromMap["Milieu3"]?.id ?? 0,
              slectedPlayerFromMap["Milieu4"]?.id ?? 0,
            ];

            final List<int> defenders = [
              slectedPlayerFromMap["bench3"]?.id ?? 0,
              slectedPlayerFromMap["Defenseur1"]?.id ?? 0,
              slectedPlayerFromMap["Defenseur2"]?.id ?? 0,
              slectedPlayerFromMap["Defenseur3"]?.id ?? 0,
              slectedPlayerFromMap["Defenseur4"]?.id ?? 0,
            ];

            final List<int> goalkeepers = [
              slectedPlayerFromMap["Gardien1"]?.id ?? 0,
              slectedPlayerFromMap["bench4"]?.id ?? 0,
            ];
            final playerPositions = {
              MyRes.kGoalKepper: 1,
              MyRes.kDefender: 4,
              MyRes.kMidfilder: 4,
              MyRes.kForward: 2,
              "bench": 4,
            };

          return
        
            buildTeamSection(
                slectedPlayerFromMap,
                playerPositions,
                context,
                forwards,
                midfielders,
                defenders,
                goalkeepers,
                playerSelected,
                listOfFantasyPlayers: listOfFantasyPlayers,
              );
          }
        );
          }

        
      

          
      