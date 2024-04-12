 import 'package:front/core/services/config.dart';
import 'package:front/features/authentification/Model/user_model.dart';
import 'package:front/features/authentification/helper/user_helper.dart';
import 'package:front/features/fantasy/helpers/player_helper.dart';

class UserService {



  Future<UserModel> getUserDataInfo() async{


final String? token = await getToken();
final response=await getResponse(token: token,
 urlBaseUrl: AppConfig.kUserBaseUrl,
  urlEndPoint: AppConfig.kGetUserInfo);

  return parseUserResponse(response, (p0) => UserModel.fromJson(p0));

 }
}