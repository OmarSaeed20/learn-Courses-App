import '../../../../../index.dart';

class ServerExceptionWidget extends StatelessWidget {
  const ServerExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBageStateWidget(
      image:' AppImages.e4042',
      fitImg: BoxFit.cover,
      title: "Server Exception",
      supTitle: "Can't conection to server",
    );
  }
}
