import '/index.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => sl<WelcomeBloc>()),
        BlocProvider(create: (context) => LearnBloc()),
        BlocProvider(create: (context) => AuthBloc(sl<UserLoginUseCase>())),
      ];
}
