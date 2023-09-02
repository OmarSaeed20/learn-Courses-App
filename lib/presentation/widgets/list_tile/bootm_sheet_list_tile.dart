import '/index.dart';

Widget bottomSheetListTile(IconData icon, String tx) => ListTile(
      leading: Icon(icon, size: 2.5.h, color: AppColors.secondary),
      title: TextWidget(tx, overflow: TextOverflow.ellipsis),
      dense: true,
      trailing: Icon(Icons.keyboard_arrow_right_rounded, size: 2.5.h),
    );
