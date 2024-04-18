


import 'package:front/features/auth/Model/user_model.dart';
import 'package:front/features/auth/service/user_service.dart';


class AuthentificationRepository {

final UserService userService ;


AuthentificationRepository({required this.userService});

Future<UserModel> getUserDataInfo() async{
  return await userService.getUserDataInfo();
  
}

}