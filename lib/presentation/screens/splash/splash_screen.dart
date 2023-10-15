import '/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => i<NavigationService>().pushNamedAndRemoveUntil(Routes.welcome),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 375.w,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            100.sH,
            Container(
              alignment: Alignment.center,
              padding: paddingOnly(top: 200, botm: 10),
              child: Icon(
                Icons.menu_book_sharp,
                color: AppColors.primaryElement,
                size: 100.h,
              ),
            ),
            TextWidget(
              'Learn Online Now',
              style: styleLarg(fontWeight: FontWeight.bold),
            ),
          ],
        ).animate().shimmer(duration: const Duration(seconds: 3)),
      ),
    );
  }
}
