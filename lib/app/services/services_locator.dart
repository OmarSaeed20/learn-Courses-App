import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learn/data/repository/auth_repo_imp.dart';

import '../../domain/usecase/sign_up_usecase.dart';
import '/index.dart';

final sl = GetIt.instance;
final i = GetIt.I;

class ServicesLocator {
  Future<void> init() async {
    i.registerLazySingleton(() => NavigationService());

    /// Bloc
    sl.registerFactory(() => WelcomeBloc());
    sl.registerFactory(() => AuthBloc(sl<UserLoginUseCase>()));
    sl.registerFactory(() => RegisterBloc(sl<SignUpUseCase>()));
    sl.registerFactory(() => LearnBloc());

    /// Use Cases
    sl.registerLazySingleton(() => UserLoginUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImp(
              sl<BaseAuthRemoteDataSource>(),
              sl<NetworkInfo>(),
            ));
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
  }
}
