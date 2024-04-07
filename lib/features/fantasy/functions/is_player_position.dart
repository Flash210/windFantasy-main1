import 'package:front/core/constants/app_constants.dart';
import 'package:front/features/fantasy/Model/player.dart';

bool isPositionValidForPlayer(Player player, String position) {
  if (position.startsWith("ben")) {
    return player.position == "Gardien" ||
        player.position == "Defenseur" ||
        player.position == "Milieu" ||
        player.position == "Attaquant";
  } else if (position == "Gardien1") {
    return player.position == "Gardien";
  } else if (position.startsWith("Def")) {
    return player.position == "Defenseur";
  } else if (position.startsWith("Mil")) {
    return player.position == MyRes.kMidfilder;
  } else if (position.startsWith("Att")) {
    return player.position == MyRes.kForward;
  } else {
    return false;
  }
}
