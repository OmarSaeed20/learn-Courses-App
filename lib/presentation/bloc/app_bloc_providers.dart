import 'package:learn/domain/usecase/sign_up_usecase.dart'; 

import '/index.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => sl<WelcomeBloc>()),
        BlocProvider(create: (context) => LearnBloc()),
        BlocProvider(
            create: (context) => AuthBloc(sl<UserLoginUseCase>() )),
        BlocProvider(
            create: (context) => LoginBloc(sl<UserLoginUseCase>() )),
        BlocProvider(create: (context) => RegisterBloc(sl<SignUpUseCase>())),
      ];
}
