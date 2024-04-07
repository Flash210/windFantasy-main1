part of 'injection_container.dart';

final sl = GetIt.instance; // Create a new instance of GetIt

Future<void> init() async {
  await authInit(); // Wait for auth initialization before proceeding

  sl.registerSingleton<TokenManager>(TokenManager());
  // ! Langauge  Provider

  sl.registerSingleton<LanguageProvider>(LanguageProvider());

// ! Home Provider
  sl.registerSingleton<HomeProvider>(HomeProvider());

  // ! Player and Team  Provider
  sl.registerSingleton<PlayerProvider>(PlayerProvider());

  // ! Fixture Provider
  sl.registerSingleton<FixtureProvider>(FixtureProvider());

   sl.registerSingleton<RankingProvider>(RankingProvider());

   sl.registerSingleton<TeamEditProvider>(TeamEditProvider());
   sl.registerSingleton<FilterProvider>(FilterProvider());
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
    authRepository: sl<AuthRepository>(), // Access AuthRepository using sl()
  ));
}
