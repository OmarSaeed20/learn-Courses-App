import '/index.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color = AppColors.white});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 2.4.h,
        width: 2.4.h,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
