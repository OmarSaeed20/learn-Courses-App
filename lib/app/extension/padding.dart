import '/index.dart';

paddingOnly({double lf = 0, double top = 0, double ri = 0, double botm = 0}) =>
    EdgeInsets.only(left: lf.w, top: top.h, right: ri.w, bottom: botm.h);

paddingSymme({double horizontal = 0, double vertical = 0}) =>
    EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);

EdgeInsetsDirectional paddingSyAll({double all = 0}) =>
    EdgeInsetsDirectional.symmetric(vertical: (all.h), horizontal: (all.w));
