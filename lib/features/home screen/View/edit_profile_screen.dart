import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/authentification/Model/user_model.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/home%20screen/View/widgets/custom_app_bar.dart';
import 'package:front/features/home%20screen/View/widgets/list_title_widget.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  late Future<UserModel?> _userModel;


  @override
  void initState() {
    super.initState();
    _userModel =
        sl<AuthProvider>().getUserInfo(); // Fetch data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar("Information"),
      body: FutureBuilder<UserModel?>(
        future: _userModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final UserModel user = snapshot.data!;
            final UserData userData = user.data;
            // getLogger(ProfileScreen);

            return Padding(
              padding:
                  const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildListTile(Icons.person, userData.name),
                            buildListTile(
                                Icons.phone, userData.phone.toString()),
                            buildListTile(
                                Icons.sports_score, userData.teamName),
                            buildListTile(Icons.wallet, "${userData.bank} \$"),
                            buildListTile(
                                Icons.score, userData.points.toString()),
                          ])),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       sl<TokenManager>().clearToken();
                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const AuthenticationScreenT(
                  //                     pageType: MyRes.kSignIn,
                  //                   )));
                  //     },
                  //     child: const Text('Log Out'))
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
