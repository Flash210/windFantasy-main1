import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/Model/user_model.dart';
import 'package:front/features/auth/ViewModel/auth_provider.dart';

import 'package:front/features/home%20screen/View/widgets/custom_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  late Future<UserModel?> _userModel;
  TextEditingController name = TextEditingController();
  TextEditingController teamName = TextEditingController();
  TextEditingController phone = TextEditingController();

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

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.15,
                    ),
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
                              TextField(
                                controller: name,
                                decoration: InputDecoration(
                                  hintText: userData.name,
                                  labelText: "Name",
                                ),
                              ),
                              TextField(
                                controller: teamName,
                                decoration: InputDecoration(
                                  labelText: "Team Name",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintText: userData.teamName,
                                ),
                              ),
                              TextField(
                                controller: phone,
                                decoration: InputDecoration(
                                  labelText: "Phone",
                                  hintText: userData.phone.toString(),
                                ),
                              ),
                            ])),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomOrangeButton(
                        backgroundColor: MyColors.kPrimaryColor,
                        text: "Submit",
                        textColor: Colors.white,
                        onTap: () {
                          sl<AuthProvider>().updateUser(
                              userId: userData.id.toString(),
                              name: name.text.trim(),
                              phone: phone.text.trim(),
                              teamName: teamName.text.trim());
                        })
                  ],
                ),
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
