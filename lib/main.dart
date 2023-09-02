import 'dart:async';
import 'dart:developer';

import 'index.dart';

void main() {
  ServicesLocator().init();

  bootstrap(() => const MyApp());
  /* runZonedGuarded(
    // ignore: deprecated_member_use
    () => BlocOverrides.runZoned(
      () => runApp(const MyApp()),
      blocObserver: MyBlocObserver(),
    ),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      debugPrint("<<error>> $error <<>> <<stackTrace>> $stackTrace");
    },
  ); /* BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  ); */
 */
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  Bloc.observer = MyBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    debugPrint(
        "<<details.stack>> ${details.stack} <<>> <<details>> ${details.exceptionAsString()}");
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      debugPrint("error $error ++ stackTrace $stackTrace");
    },
  );
}
