import '../../../../../index.dart';

class ServerFailurenWidget extends StatelessWidget {
  const ServerFailurenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBageStateWidget(
      image: 'AppImages.e404',
      title: "Server Failure",
      supTitle: "Can't conection to server",
    );
  }
}
