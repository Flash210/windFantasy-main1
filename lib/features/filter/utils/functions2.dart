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
  if (position.startsWith("Att")) {
    return "Attaquant";
  }

  if (position.startsWith("Def")) {
    return "Defenseur";
  }
  if (position.startsWith("Mil")) {
    return "Milieu";
  }
  if (position.startsWith("Gar")) {
    return "Gardien";
  }
  return "Unknown";
}
