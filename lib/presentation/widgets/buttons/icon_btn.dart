import '/index.dart';

class IconBt extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double? iconSiz;
  final Color iconColor;
  final Color backgroundColor;
  final BorderSide side;
  final BorderRadiusGeometry? borderRadius;
  final Widget? widget;
  final String tooltip;

  const IconBt({
    super.key,
    this.onPressed,
    this.icon,
    this.padding,
    this.iconSiz,
    this.iconColor = AppColors.white,
    this.backgroundColor = AppColors.primary,
    this.side = const BorderSide(width: 0, color: AppColors.transpa),
    this.borderRadius,
    this.widget,
    required this.tooltip,
    this.margin,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: IconButton.filled(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(1.2.h),
              side: side,
            ),
          ),
          iconColor: MaterialStatePropertyAll(iconColor),
          iconSize: MaterialStatePropertyAll(iconSiz ?? 6.h),
          padding: MaterialStatePropertyAll(padding ?? paddingOnly()),
        ),
        tooltip: tooltip,
        onPressed: onPressed ?? () {},
        icon: widget ?? Icon(icon),
      ),
    );
  }
}
