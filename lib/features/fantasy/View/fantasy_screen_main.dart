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
  List<bool> isCaptainList = List.generate(15, (index) => false);

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
              MySizedBox(
                height: ScreenUtils.getHeight(context) * 0.033,
              ),
              Stack(children: [
                Image.asset(
                  "assets/halff.png",
                  height: ScreenUtils.getHeight(context) * 1.01,
                  width: ScreenUtils.getWidth(context),
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
    print("playerSelected: $playerSelected");

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
