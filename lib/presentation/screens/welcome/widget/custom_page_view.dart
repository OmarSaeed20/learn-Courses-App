import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '/index.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
  });
  final String img;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          // image
          _imgWellcom(img),
          // _waveSection(),
          10.sH,

          /// Title
          _titleText(title),

          /// Sub title
          _supTitleTexts(subTitle),
        ],
      );

  // ignore: unused_element
  SizedBox _waveSection() {
    return SizedBox(
      height: 48.h,
      child: WaveWidget(
        config: CustomConfig(
          colors: [
            Colors.indigo[400]!,
            Colors.indigo[300]!,
            Colors.indigo[200]!,
            Colors.indigo[100]!
          ],
          durations: <int>[15000, 5000, 3000, 10000],
          heightPercentages: [0.75, 0.66, 0.68, 0.70],
        ),
        size: const Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    );
  }
}

Container _imgWellcom(String img) => Container(
      height: 345.w,
      width: 345.w,
      margin: paddingOnly(lf: 15, ri: 15, top: 25, botm: 15),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
      // child: Image.asset(img, fit: BoxFit.cover),
    );

Container _titleText(String s) => Container(
      width: 375.w,
      padding: const EdgeInsets.only(left: 30, right: 30).r,
      child: TextWidget(s, style: styleLarg(), textAlign: TextAlign.center),
    );

Container _supTitleTexts(String s) => Container(
      width: 375.w,
      padding: const EdgeInsets.only(right: 30, left: 30).r,
      child: TextWidget(
        s,
        style: styleSmall(fontWeight: FontWeight.w500, wordSpacing: 1.r),
        textAlign: TextAlign.center,
      ),
    );
