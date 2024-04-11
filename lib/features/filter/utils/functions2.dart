import 'package:front/core/constants/app_constants.dart';

bool checkPositonFrom(String position) {
  if (position.startsWith("Att") ||
      position.startsWith("Def") ||
      position.startsWith("Mil") ||
      position.startsWith("Gard")) {
    return false;
  }
  return true;
}

String changePositonFrom({required String position}) {
  if (position.startsWith("Att") )
     
      {
    return MyRes.kForward;
  }

  if (position.startsWith("Def")) {
    return MyRes.kDefender;
  }
  if (position.startsWith("Mil") ) {
    return MyRes.kMidfilder;
  }
  if (position.startsWith("Gar")) {
    return MyRes.kGoalKepper;
  }

  return MyRes.kUnknown;
}
