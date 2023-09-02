import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learn/data/data_source/remote/auth_remote_datasource.dart';
import 'package:learn/data/repository/auth_repo_imp.dart';

import '../../data/network/dio/app_dio.dart';
import '../../data/network/network_info.dart';
import '/index.dart';

final sl = GetIt.instance;
final i = GetIt.I;

class ServicesLocator {
  Future<void> init() async {
    i.registerLazySingleton(() => NavigationService());

    /// Bloc
    sl.registerFactory(() => WelcomeBloc());
    sl.registerFactory(() => AuthBloc(sl<UserLoginUseCase>()));
    sl.registerFactory(() => LearnBloc());

    /// Use Cases
    // sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => UserLoginUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImp(
              sl<BaseAuthRemoteDataSource>(),
              sl<NetworkInfo>(),
            ));
    /* 
     instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(sl(), sl(), sl()));
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
 */
    // network info
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    );

    // dio factory
    i.registerLazySingleton<HttpUtil>(() => HttpUtil());

/*     Dio dio = await i<DioFactory>().getDio();
    //app service client
    i.registerLazySingleton<ApiClient>(() => ApiClient(dio)); */

    /// Data Source
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
    // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    //     () => MovieRemoteDataSource(sl<AppServiceClient>()));
  }
}
