class MyRes {
  // Images
  static const basePath = "assets/";
  static const kFrenshFlag = "${basePath}fr.png";
  static const kEnglishFlag = "${basePath}eng.png";
  static String kAuthBackground = "${basePath}auth.jpg";
  static String kWindLogo = "${basePath}wind logo.png";
  static String kMatchBack = "${basePath}stade.png";
  static String kBackButton = "${basePath}back2.png";
  static String kLeagueLogo = "${basePath}league_logo.png";
  static String kStandingsBackground = "${basePath}stat2.jpg";
  static String kCheckDone = "${basePath}check_done.png";
  static String kReset = "${basePath}not_done.png";
  static String kClubIcon = "${basePath}club.png";

  //pages route names
  static const kSignIn = "Sign In";
  static const kSignUpPage = "Sign Up";
  static const kForgetPasswordPage = "Forget Password";
  static const kResetPasswordPage = "Reset Password";
  static const kEditProfile = "edit";
  static const kFantasy = "fantasy";

  //
  static const String kUnknown = "Unknown";

  // players postions
  static const String kGoalKepper = "Gardien";
  static const String kDefender = "Defenseur";
  static const String kMidfilder = "Milieu";
  static const String kForward = "Attaquant";

  static const String kGoalKepper1 = "Gardien1";

  static const List<String> kDefenders = [
    'Defenseur1',
    'Defenseur2',
    'Defenseur3',
    'Defenseur4'
  ];
  static const List<String> kMidfielders = [
    'Milieu1',
    'Milieu2',
    'Milieu3',
    'Milieu4'
  ];
  static const List<String> kForwards = [
    'Attaquant1',
    'Attaquant2',
    'Attaquant3',
    'Attaquant4'
  ];


static const List<String> kBencheds=[
  "bench1","bench2","bench3","bench4"
];


  static const List<String> kAllPlayersPositions =[
    kGoalKepper1,
    
    ...kDefenders,
    ...kMidfielders,
    ...kForwards
  ];
}
