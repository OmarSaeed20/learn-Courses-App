import '/index.dart';
/* 
Widget sizeHei([double? hei]) =>
    SizedBox(height: getProportScrHeight(hei ?? 10));

Widget sizewid([double? wid]) =>
    SizedBox(width: getProportScrHeight(wid ?? 10)); */

extension SizedBoxExtension on num {
  SizedBox get sH => SizedBox(height: toDouble().h);
  SizedBox get sW => SizedBox(width: toDouble().w);
}

extension ErrorImagee on NetworkImage {
  ImageProvider getImageError() => const AssetImage(AppImages.pError3);
}
