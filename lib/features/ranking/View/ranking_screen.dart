import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/screen_utils.dart';


import '../../../core/constants/colors.dart';
import '../../../core/services/injection_container.dart';
import '../Controller/ranking_provider.dart';
import '../model/top_user_gameweek.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});


  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  List<TopUser> topUser = [];


  @override
  void initState() {
    super.initState();
//getListOfTopUser();
  }

  @override
  Widget build(BuildContext context) {
    print("Top User is ${topUser.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking Screen'),
      ),
      body: Column(
        children: [
          MySizedBox(height: ScreenUtils.getHeight(context) * 0.1),
const MyCustomText(text: "Hey ! User "),
          const AutoSizeText(
            maxLines: 2,
            overflow: TextOverflow.visible,
            maxFontSize: 18,
            minFontSize: 13,
            "Step into the world of soccer legends. Build, "
                "manage, and compete with your fantasy team for glory! ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,

            ),
          ),






MySizedBox(
    height: ScreenUtils.getHeight(context) *0.5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildGetTopUser(onTap: (){}, text: "Top User \nIn GameWeek"),
              buildGetTopUser(onTap: (){}, text: "Top User \nIn GameWeek"),

            ],
          )



        ],
      ),
    );
  }
}




getListOfTopUser()async{
 try {
   final response = await sl<RankingProvider>().getTopUserInGameweek(15);
   if(response != null){
     return response;
   }
 } catch (e) {
   print(e);
 }

}



buildGetTopUser ({
  required void Function()? onTap,
  required String text ,

}){ return GestureDetector(
onTap: onTap,
child: Container(
decoration: BoxDecoration(
color: MyColors.kSecondaryColor,
borderRadius: BorderRadius.circular(10.0),
boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.5),
spreadRadius: 5,
blurRadius: 7,
offset: const Offset(
0, 3))]),

child: Padding(
padding: const EdgeInsets.all(20.0),
child: MyCustomText(text:text,style: const TextStyle(
color: MyColors.kWhite,)),
)));
}