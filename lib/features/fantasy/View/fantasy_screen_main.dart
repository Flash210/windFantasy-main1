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
    return 
    Scaffold(
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
              FutureBuilder<void>(
                future: setPlayerList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error fetching data'); // Handle error
                  } else {
                    return playerSelected != 15
                        ? buildCreationTeam(
                            playerSelected: playerSelected,
                            listOfFantasyPlayers: listOfFantasyPlayers)
                        : buildShowFantasyTeam(
                            context: context,
                            allPlayers: allPlayers,
                            listOfFantasyPlayers: listOfFantasyPlayers,
                            myMap: myMapOfPlayersName,
                            myTshirtMap: myMapOfTshirt,
                          );
                  }
                },
              ),
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
  }
}
