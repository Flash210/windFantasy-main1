part of 'injection_container.dart';

final sl = GetIt.instance; // Create a new instance of GetIt

Future<void> init() async {
  //! User
  sl.registerSingleton<UserService>(UserService());
  sl.registerSingleton<AuthentificationRepository>(
    AuthentificationRepository(userService: sl.get<UserService>()),
  );
  await authInit(); // Wait for auth initialization before proceeding
  await playerInit();

  sl.registerSingleton<TokenManager>(TokenManager());
  // ! Langauge  Provider

  sl.registerSingleton<LanguageProvider>(LanguageProvider());

  // ! Player and Team  Provider
  sl.registerSingleton<PlayerProvider>(
    PlayerProvider(playerRepository: sl<PlayerRepository>()),
  );

  // ! Fixture Provider
  sl.registerSingleton<FixtureProvider>(FixtureProvider());

  sl.registerSingleton<RankingProvider>(RankingProvider());

  sl.registerSingleton<TeamEditProvider>(
      TeamEditProvider(teamRepository: sl<TeamRepository>()));
  sl.registerSingleton<FilterProvider>(FilterProvider());
  sl.registerSingleton<ShowTeamProvider>(ShowTeamProvider());
  // depe link
  sl.registerSingleton<DeepLinkHandler>(DeepLinkHandler());

  //! slider range
  sl.registerLazySingleton(() => const RangeValues(2, 9));
}

Future<void> authInit() async {
  sl.registerSingleton<AuthApi>(AuthApi());

  // Ensure that AuthApi is registered before AuthRepository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(
    authApi: sl<AuthApi>(), // Access AuthApi using sl()
  ));

  sl.registerSingleton<AuthProvider>(AuthProvider(
    authRepository: sl<AuthRepository>(),
    authentificationRepository:
        sl<AuthentificationRepository>(), // Access AuthRepository using sl()
  ));
}

Future<void> playerInit() async {
  // !player
  sl.registerSingleton<PlayerApiService>(PlayerApiService());
  sl.registerSingleton<PlayerRepository>(
    PlayerRepository(sl.get<PlayerApiService>()),
  );

  //! Team
  sl.registerSingleton<TeamService>(TeamService());
  sl.registerSingleton<TeamRepository>(
    TeamRepository(teamService: sl.get<TeamService>()),
  );
}
