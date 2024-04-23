class AppConfig {
  static String kBaseUrl = "http://192.168.210.55:3001/api/";
  // ! user base url

  static String kUserBaseUrl = "${kBaseUrl}users/";
  // ! player base url

  static String kPlayerBaseUrl = "${kBaseUrl}players/";
  // ! teams base url

  static String kTeamBaseUrl = "${kBaseUrl}teams/";
  // ! fixtures base url
  static String kFixtureBaseUrl = "${kBaseUrl}fixtures/";
  // ! Validate user  base url
  static String kValidateUserBaseUrl = "${kBaseUrl}validateUser";
  // userPla
  static String kUserPlayerBaseUrl = "${kBaseUrl}userPlay/";

//  APi Endpoints

  static String kSignUpEndPoint = "signup";
  static String kSignInEndPoint = "login";
  static String kLogin = "login";
  static String kForgetPassword = "forgotpassword";
  static String kGetUserInfo = "getUserInfo";

//players
  static String kGetAllPlayers = "allPlayers";

  // teams
  static String kGetAllTeams = "allTeams";
  static String kGetUserTeam = "getUserTeam/31";
  static String kCreateTeam = "createUserTeam";

  // fixtures
  static String kGetAllFixtures = "allFixtures";

  // forget password
  static String kForgetPasswordEndPoint = "forgotpassword";
  // reset password
  static String kResetPasswordEndPoint = "resetpassword";

  //

  static String kValidateUser = "validateUser/";
  static String kGetAllRankings = "overAllRank";
}
