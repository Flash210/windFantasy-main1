part of 'fantasy_screen.dart';

class FantasyScreen extends StatefulWidget {
  const FantasyScreen({super.key});

  @override
  State<FantasyScreen> createState() => _FantasyScreenState();
}

class _FantasyScreenState extends State<FantasyScreen> {
  late Future<UserModel?> _userModel;
  late List<ShowTeam> fetchPlayersTeam;

  List<Player> allPlayers = [];
  List<ShowTeam> listOfFantasyPlayers = [];

  Map<String, dynamic> myMapOfPlayersName = {};
    Map<String, dynamic> myMapOfTshirt = {};


  @override
  void initState() {
    super.initState();
    _userModel = sl<AuthProvider>().getUserInfo();
    setPlayerList();
  }

  late int playerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: _userModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data!.data;
                playerSelected = userData.playersSelected;

                return Column(
                  children: [
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.11,
                    ),

                    Text(snapshot.data!.data.teamName,
                        style: GoogleFonts.raviPrakash(
                          textStyle: const TextStyle(
                              color: MyColors.kBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        )),

                    buildAppBar(),
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.033,
                    ),

                    // ! ...............................
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/empty.png'),
                        //fit: BoxFit.fill
                        fit: BoxFit.fitHeight,
                      )),
                      // child: InteractiveViewer(
                      //   constrained: false,
                      child: Stack(
                        children: [buildCreationAndShowTeam()],
                      ),
                    ),
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const CircularProgressIndicator(); // Placeholder for loading state
              }
            },
          ),
        ),
      ),
    );
  }

  Consumer<PlayerProvider> buildCreationAndShowTeam() {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        final slectedPlayerFromMap = playerProvider.selectedPlayersMap;

        final List<int> forwards = [
          slectedPlayerFromMap["Attaquant1"]?.id ?? 0,
          slectedPlayerFromMap["Attaquant2"]?.id ?? 0,
          slectedPlayerFromMap["bench1"]?.id ?? 0,
          slectedPlayerFromMap["bench2"]?.id ?? 0,
        ];

        final List<int> midfielders = [
          slectedPlayerFromMap["Milieu1"]?.id ?? 0,
          slectedPlayerFromMap["Milieu2"]?.id ?? 0,
          slectedPlayerFromMap["Milieu3"]?.id ?? 0,
          slectedPlayerFromMap["Milieu4"]?.id ?? 0,
          slectedPlayerFromMap["bench3"]?.id ?? 0,
          slectedPlayerFromMap["bench4"]?.id ?? 0,
        ];

        final List<int> defenders = [
          slectedPlayerFromMap["Defenseur1"]?.id ?? 0,
          slectedPlayerFromMap["Defenseur2"]?.id ?? 0,
          slectedPlayerFromMap["Defenseur3"]?.id ?? 0,
          slectedPlayerFromMap["Defenseur4"]?.id ?? 0,
        ];

        final List<int> goalkeepers = [
          slectedPlayerFromMap["Gardien1"]?.id ?? 0,
        ];
        final playerPositions = {
          MyRes.kGoalKepper: 1,
          MyRes.kDefender: 4,
          MyRes.kMidfilder: 4,
          MyRes.kForward: 2,
          "bench": 4,
        };

        return playerSelected != 15
            ? buildTeamSection(
                slectedPlayerFromMap,
                playerPositions,
                context,
                forwards,
                midfielders,
                defenders,
                goalkeepers,
                playerSelected,
                listOfFantasyPlayers: listOfFantasyPlayers,
              )
            : buildShowFantasyTeam(
                context: context,
                allPlayers: allPlayers,
                listOfFantasyPlayers: listOfFantasyPlayers,
                myMap: myMapOfPlayersName,
                myTshirtMap:myMapOfTshirt
              );

        //return buildTeamSection(slectedPlayerFromMap, playerPositions, context, forwards, midfielders, defenders, goalkeepers, moneyRemaining, playersSelected);
      },
    );
  }

  setPlayerList() async {
    allPlayers = await sl<PlayerProvider>().fetchPlayerss();
    listOfFantasyPlayers = await sl<ShowTeamProvider>().fetchTeams();
    print("lenghth " + listOfFantasyPlayers.length.toString());
    myMapOfPlayersName = await sl<TokenManager>().getMap();
    myMapOfTshirt=await  sl<TokenManager>().getTshirtMap();

  }
}
