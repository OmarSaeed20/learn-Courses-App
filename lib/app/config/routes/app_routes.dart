import '/index.dart';

Map<String, Widget Function(BuildContext)> appRoutes = <String, WidgetBuilder>{
  Routes.splash: (_) => const SplashScreen(),
  Routes.welcome: (_) => const WelcomeScreen(),
  Routes.myHomePage: (_) => const MyHomePage(), 
  Routes.signup: (_) => const SignUpForms(),
};
