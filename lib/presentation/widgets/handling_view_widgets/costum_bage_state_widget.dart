import '../../../../../index.dart';

class CustomBageStateWidget extends StatelessWidget {
  const CustomBageStateWidget({
    super.key,
    this.image,
    required this.title,
    required this.supTitle,
    this.lottie,
    this.isImage = true,
    this.fitImg,
    this.fitLot,
    this.isLoading = false,
  });
  final String? image;
  final String title;
  final String supTitle;
  final BoxFit? fitImg;
  final BoxFit? fitLot;
  final String? lottie;
  final bool? isImage;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading == true
              ? PreferredSize(
                  preferredSize: Size(double.infinity, .2.h),
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.orang3.withOpacity(.5),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryElement),
                  ),
                )
              : const Center(),
          Align(
            alignment: Alignment.center,
            child: isImage == true
                ? Image.asset(
                    image!,
                    fit: fitImg ?? BoxFit.contain,
                    height: 400.h,
                    width: 300.w,
                  )
                : Column(
                    children: [
                      6.sH,
                      /* Lottie.asset(
                        lottie!,
                        height: 250.height,
                        fit: fitLot ?? BoxFit.fitWidth,
                        width: 300.weight,
                      ), */
                    ],
                  ),
          ),
          1.5.sH,
          TextWidget(title),
          TextWidget(
            supTitle,
            style: styleSmall(),
            textAlign: TextAlign.center,
          ),
          4.sH,
        ],
      ),
    );
  }
}
