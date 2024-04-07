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

  // errors

  static const String kPhoneEmptyError = 'Please enter your phone number';
  static const String kPhoneLengthError = 'Phone number must be 8 digits ';
  static const String kEmailEmptyError = 'Please enter your email';
  static const String kEmailFormatError = 'Please enter a valid email';
  static const String kNameEmptyError = 'Please enter your name';
  static const String kTeamNameEmptyError = 'Please enter your Team Name';

  static const String kNameStartsWithNumberError =
      'Name should not start with a number';
  static const String kTeamNameStartsWithNumberError =
      'Team Name should not start with a number';
  static const String kEmailNameStartsWithNumberError =
      'Email should not start with a number';

  static const String kNameContainsNumberError =
      'Name should not contain a number';
  static const String kTeamNameContainsNumberError =
      'Team Name should not contain a number';
  static const String kPasswordEmptyError = 'Please enter your password';
  static const String kPasswordLengthError =
      'Password must be at least 8 characters long';
  static const String kPasswordUppercaseError =
      'Password must contain at least one uppercase letter';
  static const String kPasswordLowercaseError =
      'Password must contain at least one lowercase letter';
  static const String kPasswordNumberError =
      'Password must contain at least one number';
  static const String kPasswordSymbolError =
      'Password must contain at least one symbol';
  static const String kPhoneStartsWithZeroError =
      'Phone number must  not start with 0';

  // api error
  static const kSignInError =
      'Sign-in failed. Please check your credentials and try again.';
  static const kSignUpError =
      'Sign-up failed. Please check your credentials and try again.';
  static const kSignInSucces = 'You have successfully signed in !';
  static const kSignUpSucces =
      'You have successfully signed up ! Please check your email';

  // players postions
  static const String kGoalKepper = "Gardien";
  static const String kDefender = "Defenseur";
  static const String kMidfilder = "Milieu";
  static const String kForward = "Attaquant";
}
