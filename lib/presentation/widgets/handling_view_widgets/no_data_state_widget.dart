import '../../../../../index.dart';

class NoDataStateWidget extends StatelessWidget {
  const NoDataStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBageStateWidget(
      image: "AppImages.empty",
      isImage: true, 
      title: "Empty!!",
      supTitle: "no data founde",
    ); 
  }
}
