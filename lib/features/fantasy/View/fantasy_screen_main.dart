part of 'fantasy_screen.dart';

class FantasyScreen extends StatefulWidget {
  const FantasyScreen({super.key});

  @override
  State<FantasyScreen> createState() => _FantasyScreenState();
}

class _FantasyScreenState extends State<FantasyScreen> {
  late List<ShowTeam> fetchPlayersTeam;
  late int playerSelected;

  List<Player> allPlayers = [];
  List<ShowTeam> listOfFantasyPlayers = [];

  Map<String, dynamic> myMapOfPlayersName = {};
  Map<String, dynamic> myMapOfTshirt = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 232),
      appBar: AppBar(
        title: Center(
          child: MyCustomText(
            text: "Squad Page",
            style: GoogleFonts.blackOpsOne(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MySizedBox(
                height: ScreenUtils.getHeight(context) * 0.01,
              ),
              buildAppBard(context),
              MySizedBox(
                height: ScreenUtils.getHeight(context) * 0.033,
              ),
              Stack(children: [
                Image.asset(
                  "assets/halff.png",
                  height: ScreenUtils.getHeight(context) * 1.01,
                  // width: ScreenUtils.getWidth(context),
                  fit: BoxFit.cover,
                ),
                FutureBuilder<void>(
                  future: setPlayerList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Show loading indicator
                    } else if (snapshot.hasError) {
                      return Container(
                          child: Text('Error fetching data')); // Handle error
                    } else {
                      return playerSelected != 15
                          ? buildCreationTeam(
                              playerSelected: playerSelected,
                              listOfFantasyPlayers: listOfFantasyPlayers)
                          : ShowFantasyTeam(
                              allPlayers: allPlayers,
                              listOfFantasyPlayers: listOfFantasyPlayers,
                              myMapOfPlayersName: myMapOfPlayersName,
                              myTshirtMap: myMapOfTshirt);

                      // buildShowFantasyTeam(
                      //     context: context,
                      //     allPlayers: allPlayers,
                      //     listOfFantasyPlayers: listOfFantasyPlayers,
                      //     myMapOfPlayersName: myMapOfPlayersName,
                      //     myTshirtMap: myMapOfTshirt,
                      //   );
                    }
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setPlayerList() async {
    allPlayers = await sl<PlayerProvider>().fetchPlayerss();
    listOfFantasyPlayers = await sl<ShowTeamProvider>().fetchTeams();
    myMapOfPlayersName = await sl<TokenManager>().getMap();
    myMapOfTshirt = await sl<TokenManager>().getTshirtMap();
    await sl<AuthProvider>().getUserInfo();
    playerSelected = sl<AuthProvider>().userDataa!.playersSelected;

    // for (int i = 0; i < MyRes.kAllPlayersPositions.length; i++) {
    //   isCaptainList[i] = showIsCaptain(
    //       allPlayers: allPlayers,
    //       playerPosition: MyRes.kAllPlayersPositions[i],
    //       myMapOfPlayersName: myMapOfPlayersName,
    //       listOfFantasyPlayers: listOfFantasyPlayers);
    // }

    // isCaptainList.map((element) {
    //   print("isCaptainList: $element");
    // });
  }
}

Container buildAppBard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 20, bottom: 20, right: 5, left: 5),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: MyColors.kSecondaryColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 11),
            children: [
              const TextSpan(text: "Team Name: "),
              TextSpan(
                text: sl<AuthProvider>().userDataa!.teamName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const MyCustomText(
                  text: "Budget:",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  )),
              MyCustomText(
                text: "${sl<AuthProvider>().userDataa!.bank} \$",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
