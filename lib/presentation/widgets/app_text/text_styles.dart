import '/index.dart';

TextStyle styleLarg({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: 24.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );
TextStyle styleTit({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: 20.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle styleSimTit({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: 16.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle styleNormal({
  double? letterSpacing,
  double? hei,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = AppColors.black,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: hei,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle styleSmall({
  double? letterSpacing,
  double? hei,
  String? fontFamily,
  TextDecoration? decoration,
  Color? color,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: hei,
      color: color ?? AppColors.black.withOpacity(.5),
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle styleSimSmall({
  double? letterSpacing,
  double? hei,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = AppColors.black,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontSize: 12.sp,
      fontWeight: fontWeight ?? FontWeight.w300,
      height: hei,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );
