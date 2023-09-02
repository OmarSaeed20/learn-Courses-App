import '../loading_widget.dart';
import '/index.dart';

class ElvBtn extends StatelessWidget {
  const ElvBtn(
    this.tx, {
    super.key,
    required this.onTap,
    this.backColor = AppColors.grey200,
    this.icon = Icons.more_horiz,
    this.elv = 6,
    this.padding,
    this.isLoading = false,
    this.height,
    this.margin,
    this.width,
    this.titleColor = AppColors.white,
  });
  final Color titleColor;
  final VoidCallback onTap;
  final Color? backColor;
  final IconData? icon;
  final bool? isLoading;
  final String? tx;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double elv;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding ?? paddingSymme(),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elv),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.4.h),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(backColor),
          shape: MaterialStateProperty.all<StadiumBorder>(
            const StadiumBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ),
        child: isLoading!
            ? SizedBox(height: 3.h, child: const LoadingWidget())
            : tx == null
                ? Icon(icon, size: 20)
                : TextWidget(
                    tx ?? '',
                    style: styleNormal(
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
      ),
    );
  }
}
