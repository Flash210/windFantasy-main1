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
       playerSelected = Provider.of<AuthProvider>(context, listen: false)
        .userDataa!
        .playersSelected;


    setPlayerList();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEDED4),
      appBar: AppBar(
        title: Center(
            child: MyCustomText(
          text: "Squad Page",
          style: GoogleFonts.blackOpsOne(),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: SingleChildScrollView(
          child:

                Column(
                  children: [
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.01,
                    ),

                    buildAppBard(context),

                    // buildAppBar(bank: snapshot.data!.data.bank),
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.033,
                    ),

                    // ! ...............................
                    Container(


                    decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/empty.png'),
                        fit: BoxFit.fill
                       // fit: BoxFit.cover,
                      )),
                      // child: InteractiveViewer(
                      //   constrained: false,
                      child:
                      Stack(
                        children: [



                          buildCreationAndShowTeam()],
                      ),
                    ),
                    // ),
                  ],
                ),


        ),
      ),
    );
  }

  Container buildAppBard(BuildContext context) {
    return Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20,right: 5,left: 5),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: MyColors.kSecondaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text:  TextSpan(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 11),
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
                         width: ScreenUtils.getWidth(context) * 0.3,
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
                               )
                             ),
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
                         ),)
                      ],

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
                myTshirtMap: myMapOfTshirt);

        //return buildTeamSection(slectedPlayerFromMap, playerPositions, context, forwards, midfielders, defenders, goalkeepers, moneyRemaining, playersSelected);
      },
    );
  }

  setPlayerList() async {
    allPlayers = await sl<PlayerProvider>().fetchPlayerss();
    listOfFantasyPlayers = await sl<ShowTeamProvider>().fetchTeams();
    // print("lenghth " + listOfFantasyPlayers[0].);
    myMapOfPlayersName = await sl<TokenManager>().getMap();
    myMapOfTshirt = await sl<TokenManager>().getTshirtMap();
  }
}
