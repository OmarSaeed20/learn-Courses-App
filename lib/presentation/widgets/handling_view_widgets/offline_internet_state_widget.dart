import '../../../../../index.dart';

class OfflineInterNetWidget extends StatelessWidget {
  const OfflineInterNetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBageStateWidget(
      image: 'AppImages.eNowifi2', 
      title: "Offline InterNet",
      supTitle: "Can't conection to server, chick your internet data",
    );
  }
}
