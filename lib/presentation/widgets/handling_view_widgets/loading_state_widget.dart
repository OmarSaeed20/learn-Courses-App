import '/index.dart'; 

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBageStateWidget(
      isImage: false,
      isLoading: true,
      lottie: 'AppImages.loLoading',
      fitLot: BoxFit.contain,
      title: "Loading ...",
      supTitle: "please wait a second!",
    );
  }
}
