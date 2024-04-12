


import 'package:front/features/authentification/Model/user_model.dart';
import 'package:front/features/authentification/service/user_service.dart';

class AuthentificationRepository {

final UserService userService ;


AuthentificationRepository({required this.userService});

Future<UserModel> getUserDataInfo() async{
  return await userService.getUserDataInfo();
  
}

}