import '../loading_widget.dart';
import '/index.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.titleColor = AppColors.white,
    this.fontSize,
    this.height,
    this.width = double.infinity,
    this.radius,
    this.isLoading = false,
    this.border,
    this.margin,
  }) : super(key: key);
  final String text;

  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color titleColor;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double width;
  final double? radius;
  final bool isLoading;
  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 5.h,
        width: width,
        margin: margin ?? paddingOnly(botm: 2.5.h),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular((radius ?? 2).h),
          color: backgroundColor,
          gradient: LinearGradient(
            colors: [
              AppColors.primaryDeep,
              AppColors.primary.withOpacity(0.8),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: TextButton(
          onPressed: isLoading ? () {} : onTap,
          child: isLoading
              ? const Center(child: LoadingWidget())
              : TextWidget(
                  text,
                  textAlign: TextAlign.center,
                  style: styleNormal(
                    color: titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      );
}
