import '/index.dart';

class ImgErrorWidget extends StatelessWidget {
  const ImgErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.pError3, fit: BoxFit.contain);
  }
}
