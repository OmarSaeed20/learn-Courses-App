import '../../index.dart';

class SmoothIndicator extends StatelessWidget {
  const SmoothIndicator({
    super.key,
    required this.count,
    required this.i,
    this.color = AppColors.primaryElement,
  });

  final int count;
  final int i;
  final Color color;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            count,
            (index) => AnimatedContainer(
              margin: paddingSymme(horizontal: 3.5),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOutCubicEmphasized,
              width: i == index ? 25.w : 12.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: i == index ? color : AppColors.offWhite3,
                borderRadius: BorderRadius.circular(16).r,
              ),
            ),
          )
        ],
      );
}
