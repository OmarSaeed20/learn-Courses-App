import '/index.dart';

class CustomElvBtnIc extends StatelessWidget {
  const CustomElvBtnIc({
    super.key,
    this.onTap,
    this.backColor = AppColors.redOrang,
    this.foregroundColor = AppColors.grey200,
    this.titleColor = AppColors.white,
    required this.icon,
    required this.tx,
  });
  final void Function()? onTap;
  final Color? backColor;
  final Color titleColor;
  final Color? foregroundColor;
  final IconData icon;
  final String tx;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.3.h),
        ),
        backgroundColor: MaterialStateProperty.all<Color?>(backColor),
        foregroundColor: MaterialStateProperty.all<Color?>(foregroundColor),
        shape: MaterialStateProperty.all<StadiumBorder>(
          const StadiumBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ),
      icon: Icon(icon, size: 2.5.h),
      label: TextWidget(
        tx,
        style: styleNormal(
          color: titleColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
