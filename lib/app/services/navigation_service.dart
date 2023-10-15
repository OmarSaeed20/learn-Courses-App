import '/index.dart';

class NavigationService {
  // create the navigator key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // use the navigator key to push routes
  Future<dynamic> toNamed(String routeName) =>
      navigatorKey.currentState!.pushNamed(routeName);

  // use the navigator key to push routes
  Future<dynamic> pushNamedAndRemoveUntil(String routeName) =>
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (route) => false);

  // use the navigator key to push routes
  Future<dynamic> push(Widget routeName) => navigatorKey.currentState!.push(
        MaterialPageRoute<void>(builder: (BuildContext context) => routeName),
      );
  // use the navigator key to push routes
  Future<dynamic> popAndPushNamed(String routeName) =>
      navigatorKey.currentState!.popAndPushNamed(routeName);

  Future<dynamic> pushAndRemoveUntil(String routeName, Widget routePage) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (BuildContext context) => routePage),
        ModalRoute.withName(routeName),
      );

  void pop() =>
      navigatorKey.currentState!.pop(); // use the navigator key to pop routes

  bool canPop() => navigatorKey.currentState!.canPop();
}
